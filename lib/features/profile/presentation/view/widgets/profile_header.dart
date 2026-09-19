import 'dart:io';

import 'package:e_commerce_app/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  XFile? selectedImage;

  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).loadProfileImage();
    selectedImage = BlocProvider.of<ProfileCubit>(context).imagePath != ''
        ? XFile(BlocProvider.of<ProfileCubit>(context).imagePath!)
        : null;
    super.initState();
  }

  Future<void> _uploadImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage == null) return;
    setState(() {
      BlocProvider.of<ProfileCubit>(context).addProfileImage(pickedImage!);
      selectedImage = BlocProvider.of<ProfileCubit>(context).imagePath != ''
          ? XFile(BlocProvider.of<ProfileCubit>(context).imagePath!)
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const SizedBox(width: 16),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return CircularProgressIndicator();
            } else if (state is ProfileSuccess) {
              selectedImage = state.imagePath != ''
                  ? XFile(state.imagePath)
                  : null;
              return Column(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.134,
                    backgroundColor: Colors.grey.shade400,
                    child: CircleAvatar(
                      // radius: 58,
                      radius: MediaQuery.of(context).size.width * 0.13,
                      backgroundImage: selectedImage != null
                          ? FileImage(File(selectedImage!.path))
                          : const AssetImage('assets/images/user2.png'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    color: Colors.transparent,
                    title: selectedImage != null
                        ? 'Remove Photo'
                        : '+ Add Photo',
                    titleSize: 12,
                    onTap: () {
                      if (selectedImage != null) {
                        setState(() {
                          selectedImage = null;
                          BlocProvider.of<ProfileCubit>(
                            context,
                          ).removeProfileImage();
                        });
                      } else {
                        _uploadImage();
                      }
                    },
                    textColor: Colors.black54,
                    verticalPadding: 3,
                    horizontalPadding: 14,
                    horizontalMargin: 0,
                    borderRadius: 30,
                    isBorder: true,
                    borderColor: Colors.black54,
                  ),
                ],
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                FirebaseAuth
                        .instance
                        .currentUser
                        ?.providerData
                        .first
                        .displayName
                        ?.toString() ??
                    FirebaseAuth.instance.currentUser?.email!.split('@')[0] ??
                    'UnKnown User',

                // FirebaseAuth.instance.currentUser?.email!.split('@')[0] ??
                //     'UnKnown User',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 4),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,

              child: Text(
                FirebaseAuth.instance.currentUser?.email ??
                    'UnKnown Use@example.com',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
