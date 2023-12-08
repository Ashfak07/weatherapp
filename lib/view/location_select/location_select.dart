import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/wheather_controller.dart';
import 'package:weatherapp/view/home_screen/home_screen.dart';

class LocationSelect extends StatefulWidget {
  const LocationSelect({super.key});

  @override
  State<LocationSelect> createState() => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelect> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController locationcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(WeatherController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 222, 177, 228),
        body: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                    controller: locationcontroller,
                    keyboardType: TextInputType.emailAddress,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your location',
                        prefixIcon: Icon(Icons.location_on)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('required');
                      } else {
                        return null;
                      }
                    }),
              )),
              InkWell(
                onTap: () {
                  controller.getwrittenloc(locationcontroller.text);
                  if (_formkey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 114, 52, 169),
                        borderRadius: BorderRadius.circular(15)),
                    height: 50,
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
