import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:weatherapp/controller/wheather_controller.dart';
import 'package:weatherapp/models/current_weather_model.dart';
import 'package:weatherapp/utils/images.dart';
import 'package:weatherapp/utils/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime time = DateTime.now();
  late String formattedTime = DateFormat.jm().format(time);
  var date = DateTime.now();
  late var formattedDate = "${date.day}-${date.month}-${date.year}";
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(WeatherController());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 177, 228),
      body: SafeArea(
          child: Obx(() => controller.isloaded.value == true
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
                  child: FutureBuilder(
                      future: controller.currentWeatherData,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          CurrentWeatherData data = snapshot.data;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 190, 125, 205),
                                          Color.fromARGB(255, 133, 109, 180),
                                          Color.fromARGB(255, 75, 6, 159)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined),
                                          Text(data.name.toString()),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(formattedTime.toString())
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 35),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child: Image.asset(
                                                  "assets/weather/${data.weather![0].icon}.png",
                                                )),
                                            Column(
                                              children: [
                                                Text(
                                                    '${data.main!.temp}$degree'),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.calendar_month),
                                          Text(formattedDate.toString())
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                height: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 190, 125, 205),
                                          Color.fromARGB(255, 133, 109, 180),
                                          Color.fromARGB(255, 75, 6, 159)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight)),
                                child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      var values = [
                                        "${data.clouds!.all}",
                                        "${data.main!.humidity}",
                                        "${data.wind!.speed} km/h"
                                      ];
                                      var iconsList = [
                                        clouds,
                                        humidity,
                                        windspeed
                                      ];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              iconsList[index],
                                              height: 70,
                                            ),
                                            Text(values[index])
                                          ],
                                        ),
                                      );
                                    }),
                              )
                            ],
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ))),
    );
  }
}