import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_stars/src/common/404_error.dart';
import 'package:programming_stars/src/features/authentication/data/repositories/user_repository.dart';
import 'package:programming_stars/src/features/authentication/presentation/bloc/signInBloc/bloc/sign_in_bloc.dart';
import 'package:programming_stars/src/features/authentication/presentation/bloc/signUpBloc/bloc/sign_up_bloc.dart';
import 'package:programming_stars/src/features/authentication/presentation/page/sign_in_page.dart';
import 'package:programming_stars/src/features/authentication/presentation/page/sign_up_page.dart';
import 'package:programming_stars/src/features/splash/presentation/page/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/SplashState':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case '/SignUpPage':
        return MaterialPageRoute(
            builder: (_) => RepositoryProvider(
                  create: (context) => UserRepository(),
                  child: BlocProvider(
                    create: (context) => SignUpBloc(context.read()),
                    child: const SignUpPage(),
                  ),
                ));

      case '/SignInPage':
        return MaterialPageRoute(
            builder: (_) => RepositoryProvider(
                  create: (context) => UserRepository(),
                  child: BlocProvider(
                    create: (context) => SignInBloc(context.read()),
                    child: const SignInPage(),
                  ),
                ));
      default:
        return MaterialPageRoute(builder: (_) => const Error404Screen());
    }
  }
}
