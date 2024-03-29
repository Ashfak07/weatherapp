import 'package:http/http.dart' as http;
import 'package:weatherapp/models/current_weather_model.dart';
import 'package:weatherapp/models/hourly_weather_model.dart';
import 'package:weatherapp/utils/strings.dart';

getCurrentWeather(String city) async {
  var link =
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$API_KEY&units=metric";
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = currentWeatherDataFromJson(res.body.toString());

    return data;
  }
}

getHourlyWeather(lat, long) async {
  var link =
      "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=$API_KEY&units=metric";
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = hourlyWeatherDataFromJson(res.body.toString());

    return data;
  }
}
