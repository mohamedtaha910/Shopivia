import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/auth/presentation/view/log_in_page.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_auth_text_feild.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_header.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_shift.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/other_way.dart';
import 'package:e_commerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view/home_page.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
  bool isLoading = false;
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          isLoading = true;
        } else if (state is AuthSuccessState) {
          isLoading = false;
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const HomePage()));
        } else if (state is AuthErrorState) {
          isLoading = false;
          showErrorMessage(context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SafeArea(
            bottom: false,
            top: false,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                backgroundColor: AppColors.backgroundColor,
                // appBar: AppBar(),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Form(
                    key: formKey,
                    autovalidateMode: autovalidateMode,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomHeader(
                          icon: CupertinoIcons.person_crop_circle_fill,

                          showBack: true,
                        ),
                        Transform.translate(
                          offset: const Offset(0, -200),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 12),
                                SvgPicture.asset(
                                  'assets/auth_images/Sign_Up_word.svg',
                                  height: 32,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Create an account to get started',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 38),
                                Text(
                                  'Email address',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8),
                                AuthTextFeild(
                                  hintText: 'Email',
                                  height: 12,
                                  paddign: 0,

                                  icon: CupertinoIcons.mail_solid,
                                  onChanged: (value) {
                                    email = value;
                                  },
                                  borderRadius: 100,
                                  obscureText: false,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8),
                                AuthTextFeild(
                                  paddign: 0,
                                  hintText: 'Password',
                                  icon: Icons.lock,
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  height: 12,
                                  borderRadius: 100,
                                  obscureText: true,
                                ),
                                SizedBox(height: 32),
                                CustomButton(
                                  color: AppColors.primaryColor,
                                  textColor: Colors.white,
                                  title: 'Sign Up',
                                  titleSize: 17,
                                  verticalPadding: 9,
                                  horizontalMargin: 0,
                                  borderRadius: 14,
                                  onTap: () {
                                    autovalidateMode = AutovalidateMode.always;
                                    setState(() {});
                                    if (formKey.currentState!.validate()) {
                                      BlocProvider.of<AuthCubit>(
                                        context,
                                      ).registerUser(
                                        email: email!,
                                        password: password!,
                                      );
                                    }
                                  },
                                ),
                                SizedBox(height: 34),
                                OtherWay(),
                                SizedBox(height: 34),
                                CustomShift(
                                  destination: LoginPage(),
                                  text: 'Log In',
                                  text2: 'Already have an account?  ',
                                ),
                                // SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void showErrorMessage(BuildContext context, {required String message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withAlpha(50),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.error, color: Colors.pink, size: 40),
            ),
            SizedBox(height: 24),
            Text(
              message,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 32),
            CustomButton(
              title: 'Ok',
              titleSize: 15,
              onTap: () {
                Navigator.pop(context);
              },
              verticalPadding: 8,
              color: Colors.red.withAlpha(50),
              textColor: Colors.pink,
              horizontalMargin: 50,
            ),
          ],
        ),
      ),
    );
  }
}
