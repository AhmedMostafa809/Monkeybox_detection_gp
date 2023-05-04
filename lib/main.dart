import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkeybox_final/Cubit/theme_cubit.dart';
import 'package:monkeybox_final/view/auth/Login&SignUp.dart';
import 'package:monkeybox_final/view/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'Cubit/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSharedPrefs();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => ThemeCubit()),
    ],
    child: MyApp(),
  ));
}
Future<void> initSharedPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isDark', false);
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final ThemeCubit themeCubit = ThemeCubit();
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (context) => ThemeCubit()..initTheme(),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
                home: AuthPage(),
              );
            },
          ),
        );
      },
    );
  }
}
