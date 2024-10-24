part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final List<WeatherModel> data;

  WeatherSuccess(this.data);
}

final class WeatherFailed extends WeatherState {
  final String error;

  WeatherFailed(this.error);
}


// Theme states
final class AppThemDark extends WeatherState {}

final class AppThemLight extends WeatherState {}
