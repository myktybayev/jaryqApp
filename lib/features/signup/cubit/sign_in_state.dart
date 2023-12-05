part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {
  final String email;
  final String password;

  SignInInitial({required this.email, required this.password});
}

final class SignInLoading extends SignInState {}

final class SignInLoaded extends SignInState {
  final UserCredential userCredential;
  SignInLoaded({required this.userCredential});
}

final class SignInFailed extends SignInState {
  final String errorMessage;

  SignInFailed({required this.errorMessage});
}
