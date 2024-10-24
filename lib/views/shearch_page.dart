import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  static String routeName = "searchPage";
  late TextEditingController place = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                    "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExN2F4c2hjaHpidml2YmRzZDRtNDRwd2NzMTNqOG43eHJqMHh0c205ZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/11hgDsVhGh36Le/giphy.gif"),
                const SizedBox(height: 20),
                TextField(
                  controller: place,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.cloudy_snowing),
                      fillColor: const Color(0xAA99AFAF),
                      labelText: 'Search',
                      hintText: 'Search for places',
                      suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<WeatherCubit>(context)
                              .getWeather(city: place.text);
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.search),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
