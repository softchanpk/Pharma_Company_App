
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sc_pharma_app/controller/get_location_controller.dart';
import 'package:sc_pharma_app/widgets/navigation_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/colors.dart';

class TagLocationScreen extends StatefulWidget {
  String? userId,userName;

  TagLocationScreen(String userId, String userName){
    this.userId = userId;
    this.userName = userName;
  }

  @override
  State<TagLocationScreen> createState() => _TagLocationScreenState();
}

class _TagLocationScreenState extends State<TagLocationScreen> {
  final Completer<GoogleMapController> _completer = Completer();
  GetLocationController getLocationController = Get.put(GetLocationController());
  String stAddress = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async{
      await getLocationController.getUserCurrentLocation();
      stAddress = getLocationController.stAddress;
      if(kDebugMode){
        print(getLocationController.latitude);
        print(getLocationController.longitude);
      }
    });

  }
  List<Marker> _marker = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('Tag Your Location',style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xff2d2f44),
            )
        ),
        ),
        iconTheme: const IconThemeData(color: Color(0xff2d2f44),),
      ),
      drawer: NavigationDrawerScreen(widget.userId!,widget.userName!),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: GetBuilder<GetLocationController>(
              init: getLocationController,
              builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.03,),


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Map View",
                        style: GoogleFonts.openSans(
                            fontSize: 15
                        ),

                      ),
                    ),
                    SizedBox(height: size.height * 0.015,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: size.width * 0.9,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: getLocationController.getLocationStatus ? GoogleMap(

                        initialCameraPosition: CameraPosition(target: LatLng(getLocationController.latitude,getLocationController.longitude),
                            zoom: 15),
                        markers: Set<Marker>.of(<Marker>[
                          Marker(
                            markerId: MarkerId('1'),
                            position: LatLng(getLocationController.latitude,getLocationController.longitude),
                          ),
                        ]),
                        mapType: MapType.normal,
                        onMapCreated: (GoogleMapController controller){
                          _completer.complete(controller);
                        },
                      ) :
                      Center(
                        child: Text("Loading Map..."),
                      ),
                    ),
                    SizedBox(height: size.height * 0.015,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Current Location:",
                        style: GoogleFonts.openSans(
                            fontSize: 15
                        ),

                      ),
                    ),
                    SizedBox(height: size.height * 0.015,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Latitude: ${getLocationController.latitude}",
                            style: GoogleFonts.openSans(
                                fontSize: 15
                            ),


                          ),
                      Text("Longitude: ${getLocationController.longitude}",
                        style: GoogleFonts.openSans(
                            fontSize: 15
                        ),
                      )
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.015,),
                    ListTile(
                      leading: Text("Address:",
                        style: GoogleFonts.openSans(
                            fontSize: 15
                        ),
                      ),
                      title:  Text(stAddress,style: GoogleFonts.openSans(
                          fontSize: 15
                        ),)

                    ),
                    SizedBox(height: size.height * 0.015,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        maxLines: 3,
                        cursorColor: Color(0xff2d2f44),
                        decoration: InputDecoration(

                            hintText: "Description",
                            hintStyle: GoogleFonts.openSans(
                                fontSize: 15
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff2d2f44)),

                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.015,),
                    Center(
                      child: ElevatedButton(onPressed: (){}, child: Text("Submit", style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600
                      ),), style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          backgroundColor: BUTTONCOLOR
                      ),
                      ),
                    )
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
