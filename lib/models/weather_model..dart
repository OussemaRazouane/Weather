class WeatherOnboardModel {
  final String img;
  final String title;
  final String des;
  WeatherOnboardModel(
      {required this.img, required this.title, required this.des});
}

List<WeatherOnboardModel> weathersOnboard = [
  WeatherOnboardModel(
      img: 'assets/images/1.jpg',
      title: 'Welcome to MyWeather',
      des:
          'A cheerful introduction screen with an inviting message like “Welcome to Your Personal Weather Assistant.” The background may feature a bright sky with sun and clouds. The page reassures users that the app will help them stay updated with real-time weather information. An illustration shows various weather symbols (e.g., sun, clouds, rain).'),
  WeatherOnboardModel(
      img: 'assets/images/2.jpg',
      title: 'Real-Time Weather Updates',
      des:
          'This page emphasizes how the app provides live weather conditions and forecasts. The background might showcase an animated weather radar or a map with cloud movements. Key features like temperature, precipitation, and wind speed are highlighted with icons. The text explains, "Get instant updates on weather changes around you.'),
  WeatherOnboardModel(
      img: 'assets/images/3.jpg',
      title: 'Detailed Hourly and Daily Forecasts',
      des:
          'The focus here is on the app’s detailed forecast options, displaying an illustration or graph of hourly temperature changes or a 7-day weather forecast. The page conveys that users can plan their day and week with confidence. Colors might change to match weather conditions like sunny, cloudy, or rainy. Text explains, "Plan ahead with detailed forecasts for every hour and day.'),
  WeatherOnboardModel(
      img: 'assets/images/4.jpg',
      title: 'Severe Weather Alerts',
      des:
          'The final page shows the app’s alert system, warning users of extreme weather events like storms or heavy rainfall. The page features a red or orange warning icon to symbolize urgency. The text says, “Stay safe with instant severe weather alerts.” The visual could include lightning or storm clouds to indicate danger.'),
];

class WeatherModel {
  final String cityName;
  final String date;
  final double avgTemp;
  final double minTemp;
  final double maxTemp;
  final String status;
  final String icon;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.avgTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.status,
    required this.icon,
  });
  
  factory WeatherModel.fromJson(Map<String,dynamic>json,int i){
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['forecast']['forecastday'][i]['date'],
      avgTemp: json['forecast']['forecastday'][i]['day']['avgtemp_c'],
      minTemp: json['forecast']['forecastday'][i]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][i]['day']['maxtemp_c'],
      status: json['forecast']['forecastday'][i]['day']['condition']['text'],
      icon: "http:${json['forecast']['forecastday'][i]['day']['condition']['icon']}",
    );
  }
}
