
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class GetLocationController extends GetxController {
  double latitude = 0.0;
  double longitude = 0.0;
  String stAddress = '';
  bool _isLocationFetched = false;

  Future<void> getUserCurrentLocation() async{

    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace){
      Get.snackbar('Location Denied', error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Color(0xff420331),);
    });
    var locationData = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitude = locationData.latitude;
    longitude = locationData.longitude;
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    stAddress = placemarks.reversed.last.country.toString() + "," +placemarks.reversed.last.locality.toString()+","+placemarks.reversed.last.name.toString();
    _isLocationFetched = true;
    update();
  }
  bool get getLocationStatus{
    return _isLocationFetched;
}
}