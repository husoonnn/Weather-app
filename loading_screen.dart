import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'location_screen.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    //async keyword will cause time consuming taskings that require fetching data for example to happen in the background rather than the foreground which may freeze up the app
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
      //passing the weatherData over to location screen for location screen to use the data
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState Called');
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitPouringHourGlass(
        color: Colors.white,
        size: 50.0,
      )),
    );
  }
}
