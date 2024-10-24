import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather/models/weather_model..dart';

part 'weather_state.dart';

late List<WeatherModel> weathers;

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  getWeather({required city}) async {
    try {
      emit(WeatherLoading());
      Response res = await Dio().get(
          "http://api.weatherapi.com/v1/forecast.json?key=6d8023f1fceb4ac5848142510241510&q=${city}&days=4&aqi=no&alerts=no");
      List<WeatherModel> w = [
        WeatherModel.fromJson(res.data, 0),
        WeatherModel.fromJson(res.data, 1),
        WeatherModel.fromJson(res.data, 2),
        WeatherModel.fromJson(res.data, 3),
      ];
      emit(WeatherSuccess(w));
      weathers = w;
    } on DioException catch (e) {
      final err =
          e.response?.data['error']['message'] ?? "Something went wrong";
      emit(WeatherFailed(err));
    } catch (e) {
      emit(WeatherFailed(e.toString()));
    }
  }

  getMode(bool dark) {
    if (dark) {
      emit(AppThemDark());
    } else {
      emit(AppThemLight());
    }
  }
}
