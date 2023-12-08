import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp/models/hourly_weather_model.dart';
import 'package:weatherapp/services/api_services.dart';

class WeatherController extends GetxController {
  @override
  void onInit() {
    getUserLocation();
    currentWeatherData = '';
    // TODO: implement onInit
    super.onInit();
  }

  dynamic currentWeatherData;
  dynamic hourlyWeatherData;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  var isloaded = false.obs;
  getUserLocation() async {
    bool isLocationEnabled;
    LocationPermission userPermission;

    isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      return Future.error("Location is not enabled");
    }

    userPermission = await Geolocator.checkPermission();
    if (userPermission == LocationPermission.deniedForever) {
      return Future.error("Permission is denied forever");
    } else if (userPermission == LocationPermission.denied) {
      userPermission = await Geolocator.requestPermission();
      if (userPermission == LocationPermission.denied) {
        return Future.error("Permission is denied");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      latitude.value = value.latitude;
      longitude.value = value.longitude;
      isloaded.value = true;
    });
  }

  void getwrittenloc(String city) {
    currentWeatherData = getCurrentWeather(city);
  }
}
