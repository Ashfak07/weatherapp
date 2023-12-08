import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:weatherapp/controller/wheather_controller.dart';
import 'package:weatherapp/models/current_weather_model.dart';
import 'package:weatherapp/utils/Text_const.dart';
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
                                        end: Alignment.bottomRight),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                            255, 118, 114, 114),
                                        offset: Offset(9.0, 9), //(x,y)
                                        blurRadius: 2.0,
                                      )
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined),
                                          Text(
                                            data.name.toString(),
                                            style: TextStyleConstants.heading3,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          Text(
                                            formattedTime.toString(),
                                            style: TextStyleConstants.heading4,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 35),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          Color.fromARGB(255,
                                                              190, 125, 205),
                                                          Color.fromARGB(255,
                                                              133, 109, 180),
                                                          Color.fromARGB(
                                                              255, 75, 6, 159)
                                                        ],
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 37, 37, 37),
                                                        offset: Offset(
                                                            2.0, 3), //(x,y)
                                                        blurRadius: 2.0,
                                                      )
                                                    ]),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.asset(
                                                    "assets/weather/${data.weather![0].icon}.png",
                                                  ),
                                                )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    '${data.main!.temp}$degree',
                                                    style: TextStyleConstants
                                                        .heading3,
                                                  ),
                                                ],
                                              ),
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
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            formattedDate.toString(),
                                            style: TextStyleConstants.heading5,
                                          )
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
                                height: 310,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 190, 125, 205),
                                          Color.fromARGB(255, 133, 109, 180),
                                          Color.fromARGB(255, 75, 6, 159)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                            255, 118, 114, 114),
                                        offset: Offset(9.0, 9), //(x,y)
                                        blurRadius: 2.0,
                                      )
                                    ]),
                                child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      var values = [
                                        "Cloudy-${data.clouds!.all}",
                                        "Humidity-${data.main!.humidity}",
                                        "Wind-${data.wind!.speed} km/h"
                                      ];
                                      var iconsList = [
                                        clouds,
                                        humidity,
                                        windspeed
                                      ];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14),
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Color.fromARGB(
                                                            255, 190, 125, 205),
                                                        Color.fromARGB(
                                                            255, 133, 109, 180),
                                                        Color.fromARGB(
                                                            255, 133, 87, 192)
                                                      ],
                                                      begin: Alignment.topLeft,
                                                      end: Alignment
                                                          .bottomRight),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 37, 37, 37),
                                                      offset: Offset(
                                                          2.0, 3), //(x,y)
                                                      blurRadius: 2.0,
                                                    )
                                                  ]),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                  iconsList[index],
                                                  height: 70,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                                child: Text(
                                              values[index],
                                              style:
                                                  TextStyleConstants.heading5,
                                            ))
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
