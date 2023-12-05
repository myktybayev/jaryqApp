import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ruhani_app/features/signup/cubit/sign_in_cubit.dart';
import 'package:ruhani_app/routing/app_roures.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    // final state = context.watch<SignInCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),

      //BlocConsumer: listener and builder
      //BlocListener: only for listener
      //BlocBuilder: only for build

      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInLoaded) {
            Navigator.of(context)
                .pushNamed(AppRoutes.home, arguments: state.userCredential);
          }
        },
        buildWhen: (previousState, currentState) {
          return currentState is! SignInLoaded;
        },
        builder: (BuildContext context, SignInState state) {
          if (state is SignInInitial) {
            return Center(
              child: Column(
                children: [
                  TextFormField(
                    // onChanged: context.read<SignInCubit>().onEmailChanged
                    onChanged: (email) {
                      context.read<SignInCubit>().onEmailChanged(email);
                    },
                  ),
                  TextFormField(
                    // onChanged: context.read<SignInCubit>().onPasswordChanged
                    onChanged: (password) {
                      context.read<SignInCubit>().onPasswordChanged(password);
                    },
                  ),
                  ElevatedButton(
                    onPressed: context.read<SignInCubit>().firebaseSignIn,
                    child: const Text('Sign in'),
                  ),
                ],
              ),
            );
          }

          if (state is SignInLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is SignInFailed) {
            return Center(
              child: Text('Error: ${state.errorMessage.toString()}'),
            );
          }

          return const Center(
            child: Text('By default'),
          );
        },
      ),
    );
  }
}
