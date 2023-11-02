import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_stars/src/config/theme/dark_theme.dart';
import 'package:programming_stars/src/config/theme/light_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeData.light()) {
    //when app is started
    on<InitialThemeSetEvent>((event, emit) async {
      final bool hasDarkTheme = await isDark();
      if (hasDarkTheme) {
        emit(dark);
      } else {
        emit(light);
      }
    });

    //while switch is clicked
    on<ThemeSwitchEvent>((event, emit) {
      final isDark = state == ThemeData.dark();
      emit(isDark ? light : dark);
      setTheme(isDark);
    });
  }
}

Future<bool> isDark() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("is_dark") ?? false;
}

Future<void> setTheme(bool isDark) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("is_dark", !isDark);
}




// import 'package:efood_multivendor/util/app_constants.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ThemeController extends GetxController implements GetxService {
//   final SharedPreferences sharedPreferences;
//   ThemeController({@required this.sharedPreferences}) {
//     _loadCurrentTheme();
//   }

//   bool _darkTheme = false;
//   bool get darkTheme => _darkTheme;

//   void toggleTheme() {
//     _darkTheme = !_darkTheme;
//     sharedPreferences.setBool(AppConstants.THEME, _darkTheme);
//     update();
//   }

//   void _loadCurrentTheme() async {
//     _darkTheme = sharedPreferences.getBool(AppConstants.THEME) ?? false;
//     update();
//   }
// }