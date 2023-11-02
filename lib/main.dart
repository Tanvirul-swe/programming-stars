import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:programming_stars/src/config/theme/bloc/theme_bloc.dart';
import 'package:programming_stars/src/constant/app_constant.dart';
import 'package:programming_stars/src/routing/routing.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(BlocProvider(
    create: (context) => ThemeBloc()..add(InitialThemeSetEvent()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, state) {
        return GetMaterialApp(
          title: AppConstant.APP_NAME,
          theme: state,
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
          initialRoute: '/SplashState',
        );
      },
    );
  }
}
