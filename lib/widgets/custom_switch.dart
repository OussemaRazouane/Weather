import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/databases/cache_helper.dart';

class MySwitch extends StatefulWidget {
  const MySwitch({super.key});

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  save() {
    if (!CacheHelper.containKey(key: "mode")) {
      CacheHelper.saveData(key: "mode", value: true);
    }
  }

  late bool val;
  @override
  Widget build(BuildContext context) {
    save();
    val = CacheHelper.getData(key: "mode");
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return FlutterSwitch(
          width: 90.0,
          height: 45.0,
          toggleSize: 40.0,
          value: val,
          borderRadius: 30.0,
          padding: 4.0,
          showOnOff: false,
          activeIcon: const Icon(
            Icons.nightlight_round,
            color: Colors.white,
          ),
          inactiveIcon: const Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
          activeColor: Colors.purple[900]!,
          inactiveColor: Colors.black,
          activeToggleColor: Colors.purple[700]!,
          inactiveToggleColor: Colors.black54,
          onToggle: (c) {
            val = c;
            CacheHelper.saveData(key: "mode", value: val);
            BlocProvider.of<WeatherCubit>(context).getMode(val);
          },
        );
      },
    );
  }
}
