// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // ---------------------------- Register Function --------------------------------
  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());
    var auth = FirebaseAuth.instance;
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(AuthErrorState('The account already exists for that email.'));
      } else if (e.code == 'weak-password') {
        emit(AuthErrorState('The password provided is too weak.'));
      } else {
        emit(AuthErrorState('something went wrong'));
      }
    } catch (e) {
      emit(AuthErrorState('There was an error'));
    }
  }

  // ---------------------------- Login Function --------------------------------

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());
    var auth = FirebaseAuth.instance;
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthErrorState('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthErrorState('Wrong password provided for that user.'));
      } else {
        emit(AuthErrorState('The email or password is incorrect'));
      }
    } catch (e) {
      emit(AuthErrorState('something went wrong'));
    }
  }

  // ---------------------------- Login Function With Google --------------------------------

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();
      if (googleUser == null) {
        return;
      }
      emit(AuthLoadingState());

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(AuthSuccessState());
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        // المستخدم ألغى تسجيل الدخول
        emit((AuthInitial()));
        return;
      }

      emit(AuthErrorState(e.toString()));
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }
}
