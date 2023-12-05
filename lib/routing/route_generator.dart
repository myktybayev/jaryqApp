import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ruhani_app/core/navigation/main_page.dart';
import 'package:ruhani_app/features/books/domain/book.dart';
import 'package:ruhani_app/features/books/ui/book_reader.dart';
import 'package:ruhani_app/features/signup/cubit/sign_in_cubit.dart';
import 'package:ruhani_app/features/signup/sign_in.dart';
import 'package:ruhani_app/routing/app_roures.dart';

class RouteGenerator {
  static Route<Object?>? generateRoute(RouteSettings settings) {
    final routeName = settings.name;

    switch (routeName) {
      case AppRoutes.signIn:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SignInCubit>(
            create: (context) => SignInCubit(),
            child: const SignInScreen(),
          ),
        );

      case AppRoutes.bookReader:
        final book = settings.arguments as Book;

        return MaterialPageRoute(
          builder: (context) {
            return BookReader(book: book);
          },
        );

      case AppRoutes.home:
        // final userCredential = settings.arguments as UserCredential;
        return MaterialPageRoute(
          builder: (context) {
            return MainPage();
            // return MainPage(userCredential: userCredential);
          },
        );

      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(
        settings: settings, builder: (BuildContext context) => child);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'ERROR!!',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 450.0,
                  width: 450.0,
                  // child: Lottie.asset('assets/lottie/error.json'),
                ),
                Text(
                  'Seems the route you\'ve navigated to doesn\'t exist!!',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
