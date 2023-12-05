import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial(email: '', password: ''));

  void onEmailChanged(String email) {
    final currentState = state as SignInInitial;

    emit(SignInInitial(email: email, password: currentState.password));
  }

  void onPasswordChanged(String password) {
    final currentState = state as SignInInitial;

    emit(SignInInitial(email: currentState.email, password: password));
  }

  void firebaseSignIn() async {
    final currentState = state as SignInInitial;

    emit(SignInLoading());

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: currentState.email,
        password: currentState.password,
      );

      await credential.user?.updateDisplayName("Test Vasya");

      emit(SignInLoaded(userCredential: credential));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignInFailed(errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignInFailed(
            errorMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(SignInFailed(errorMessage: e.toString()));
    }
  }
}
