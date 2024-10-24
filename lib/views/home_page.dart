import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/databases/cache_helper.dart';
import 'package:weather/views/shearch_page.dart';
import 'package:weather/widgets/custom_switch.dart';
import 'package:weather/widgets/get_weather.dart';
import 'package:weather/widgets/no_weather.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const routeName = "homePage";
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  save() async {
    await CacheHelper.saveData(key: "go", value: true);
  }

  @override
  Widget build(BuildContext context) {
    save();
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
            if (state is WeatherSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 10),
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const MySwitch(),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.deepPurpleAccent,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, SearchPage.routeName);
                                },
                                icon: const Icon(Icons.search)),
                          )
                        ],
                      ),
                    ),
                  ),
                  SwapWeather(),
                ],
              );
            }else if(state is WeatherLoading){
              return const Center(child: CircularProgressIndicator());
            }else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 10),
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const MySwitch(),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.deepPurpleAccent,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, SearchPage.routeName);
                                },
                                icon: const Icon(Icons.search)),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Center(child:NoWeather()),
                  
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
