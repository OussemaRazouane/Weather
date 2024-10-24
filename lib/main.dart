import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/databases/cache_helper.dart';
import 'package:weather/views/home_page.dart';
import 'package:weather/views/onboarding_page.dart';
import 'package:weather/views/shearch_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final bool pace = CacheHelper.containKey(key: "go");
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme:  state is AppThemDark? ThemeData.dark() : ThemeData.light(),
              routes: {
                OnboardingPage.routeName: (context) => const OnboardingPage(),
                Home.routeName: (context) => const Home(),
                SearchPage.routeName: (context) =>  SearchPage(),
              },
              initialRoute: pace ? Home.routeName : OnboardingPage.routeName,
            );
        },
      ),
    );
  }
}
