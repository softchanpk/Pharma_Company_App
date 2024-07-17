import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sc_pharma_app/controller/visit_editing_controller.dart';
import 'package:sc_pharma_app/controller/visit_schueduele_controller.dart';
import 'package:sc_pharma_app/widgets/card.dart';
import 'package:badges/badges.dart' as badge;
import 'package:sc_pharma_app/widgets/navigation_drawer.dart';

import 'package:sc_pharma_app/models/visit_model.dart';

import 'package:sc_pharma_app/colors.dart';

import '../widgets/colors.dart';

class VisitSchduele extends StatefulWidget {

  String? userId, userName;
  VisitSchduele(String userId,String userName){
    this.userId = userId;
    this.userName = userName;
  }
  @override
  State<VisitSchduele> createState() => _VisitSchdueleState();
}

class _VisitSchdueleState extends State<VisitSchduele> {
  VisitEditingController _visitEditingController = VisitEditingController();
  String _transactionNo = "";
  String _schuedueleDate = "";

  String? clinic;

  String? doctor;

  String? visittype;

  String? comment;

  String? result;

  String? completiondate;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  VisitModel? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      _visitEditingController.getVisitData(widget.userId!);
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Visit Scheduele",
          style: GoogleFonts.openSans(
              color: BUTTONCOLOR,
              fontWeight: FontWeight.w600,
              fontSize: 25
          ),
        ),
        iconTheme: IconThemeData(
            color: BUTTONCOLOR
        ),
      ),
      drawer: NavigationDrawerScreen(widget.userId!,widget.userName!),
      body: Container(
        width: size.width,
        height: size.height,
        child: GetBuilder<VisitEditingController>(
            init: _visitEditingController,
            builder: (context) {
              return _visitEditingController.getIsDataFetched ? ListView.builder(itemBuilder: (ctx, index){
                var cardBgColor = index % 2 == 0 ? CARDGRADIENT : BUTTONCOLOR;
                data = _visitEditingController.getModel;
                return InkWell(
                  onTap: (){
                    showModal(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                    child: CustomCard(bgColor: cardBgColor, images: [
                      Image.asset("assets/images/calendar.png", width: 25, height: 25, color: Colors.white,),
                      Image.asset("assets/images/transaction.png", width: 25, height: 25, color: Colors.white,),
                      Image.asset("assets/images/clinic.png", width: 25, height: 25, color: Colors.white,),
                      Image.asset("assets/images/doctor.png", width: 25, height: 25, color: Colors.white,),
                    ], fields: [
                      data!.items![index].vstschdt!,
                      data!.items![index].vstno!.toString(),
                      data!.items![index].vsttypdsc!,
                      data!.items![index].sprname!,
                    ],),
                  ),
                );
              },
                itemCount: 2,
              ) : Center(
                child: Text("Loading"),
              );
            }
        ),
      ),
    );
  }
  showModal(int index){
    Size size = MediaQuery.of(context).size;
    showDialog(context: context, builder: (ctx){
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.only(right: 5, left: 5, bottom: 5),
        content: badge.Badge(
          position: badge.BadgePosition.topEnd(top: -15),
          badgeStyle: badge.BadgeStyle(
              badgeColor: Colors.transparent
          ),
          //showBadge: false,
          badgeContent: InkWell(
            child: CircleAvatar(
              radius: 25,
              backgroundColor: BUTTONCOLOR,
              child: Text("x",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                ),
              ),
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),

          child: Container(
            width: size.width,
            height: size.height * 0.85,
            decoration: BoxDecoration(
                gradient: CARDGRADIENT,
                borderRadius: BorderRadius.circular(20)
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.03,),
                    ListTile(
                      leading: Icon(Icons.transform_outlined,size: 25,color: Colors.white,),
                      title: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black)
                          ),

                        ),
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.white
                          ),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white),
                            labelText: "Visit no",
                          ),
                          initialValue: data!.items![index].vstno!.toString(),
                          onSaved: (trans){
                            _transactionNo = trans!;
                          },
                          validator: (trans){
                            if(trans == ""){
                              return "Please enter valid transaction no";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    ListTile(
                      leading: Image.asset("assets/images/calendar.png", width: 25, height: 25, color: Colors.white,),
                      title: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black)
                          ),

                        ),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: InkWell(onTap: (){
                                showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now());
                              }, child: Image.asset("assets/images/calendar.png", width: 25, height: 25,color: Colors.white,),),
                              labelText: "Visit Date",
                              labelStyle: TextStyle(color: Colors.white)

                          ),
                          initialValue: data!.items![index].vstschdt,
                          onSaved: (date){
                            _schuedueleDate = date!;
                          },
                          validator: (date){
                            if(date == ""){
                              return "Please enter correct date";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    ListTile(
                      leading: Image.asset("assets/images/clinic.png", width: 25, height: 25, color: Colors.white,),
                      title: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black)
                          ),

                        ),
                        child: DropdownButtonFormField(
                          dropdownColor: BUTTONCOLOR,
                          icon: Padding(child: Icon(Icons.arrow_drop_down, color: Colors.white, size: 25,),
                            padding: EdgeInsets.only(right: 14),
                          ),
                          items: [],
                          decoration: InputDecoration(
                            enabled: false,
                            border: InputBorder.none,
                            labelText: "Clinics",
                            //suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.white, size: 25,),
                            labelStyle: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          //cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.white
                          ),
                          onSaved: (data){
                            //clinic = data;
                          },
                          onChanged: (data){
                            //clinic = data;
                          },
                          validator: (data){
                            if(data == ""){
                              return "Please enter valid correct clinic name";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    ListTile(
                      leading: Image.asset("assets/images/doctor.png", width: 25, height: 25, color: Colors.white,),
                      title: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black)
                          ),

                        ),
                        child: DropdownButtonFormField(
                            dropdownColor: BUTTONCOLOR,
                            icon: Padding(child: Icon(Icons.arrow_drop_down, color: Colors.white, size: 25,),
                              padding: EdgeInsets.only(right: 14),
                            ),
                            items: [],
                            decoration: InputDecoration(
                              enabled: false,
                              border: InputBorder.none,
                              labelText: "Doctors",
                              //suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.white, size: 25,),
                              labelStyle: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            style: TextStyle(
                                color: Colors.white
                            ),
                            onSaved: (data){
                              //doctor = data!;
                            },
                            onChanged: (data){
                             // doctor = data;
                            },
                            validator: (data){
                              if(data == ""){
                                return "Please enter valid correct doctor name";
                              }
                              return null;
                            }
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    ListTile(
                      leading: Icon(Icons.location_city,size: 25,color: Colors.white,),
                      title: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black)
                          ),

                        ),
                        child: DropdownButtonFormField(
                          dropdownColor: BUTTONCOLOR,
                          icon: Padding(child: Icon(Icons.arrow_drop_down, color: Colors.white, size: 25,),
                            padding: EdgeInsets.only(right: 14),
                          ),
                          items: [],

                          decoration: InputDecoration(
                            enabled: false,
                            border: InputBorder.none,
                            labelText: "Visit Type",
                            labelStyle: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          style: TextStyle(
                              color: Colors.white
                          ),
                          onSaved: (data){
                            //visittype = data;
                          },
                          validator: (data){
                            if(data == ""){
                              return "Please enter valid correct visit type";
                            }
                            return null;
                          },
                          onChanged: (data){
                           // visittype = data;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    ListTile(
                      leading: Image.asset("assets/images/comments.png", width: 25, height: 25, color: Colors.white,),
                      title: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black)
                          ),

                        ),
                        child: TextFormField(
                            maxLines: 3,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Remarks",
                                labelStyle: TextStyle(
                                    color: Colors.white
                                )
                            ),
                            cursorColor: Colors.white,
                            style: TextStyle(
                                color: Colors.white
                            ),
                            onSaved: (data){
                              comment = data;
                            },
                            validator: (data){
                              if(data == ""){
                                return "Please enter valid comments";
                              }
                              return null;
                            },
                          initialValue: data!.items![index].schremarks,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    ListTile(
                      leading: Icon(
                        Icons.file_copy_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                      title: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black)
                          ),

                        ),
                        child: DropdownButtonFormField(
                          dropdownColor: BUTTONCOLOR,
                          icon: Padding(child: Icon(Icons.arrow_drop_down, color: Colors.white, size: 25,),
                            padding: EdgeInsets.only(right: 14),
                          ),
                          items: [],
                          style: TextStyle(
                              color: Colors.white
                          ),
                          decoration: InputDecoration(
                            enabled: false,
                            border: InputBorder.none,
                            labelText: "Visit Results",
                            labelStyle: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          onSaved: (data){
                            //result = data;
                          },
                          validator: (data){
                            if(data == ""){
                              return "Please enter valid result";
                            }
                            return null;
                          },
                          onChanged: (data){
                            //result = data;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    ListTile(
                      leading: Image.asset("assets/images/calendar.png", width: 25, height: 25, color: Colors.white,),
                      title: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black)
                          ),

                        ),
                        child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: InkWell(onTap: (){
                                  showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now());
                                }, child: Image.asset("assets/images/calendar.png", width: 25, height: 25,color: Colors.white,),),
                                labelText: "Completion Date",
                                labelStyle: TextStyle(color: Colors.white)

                            ),
                            initialValue: data!.items![index].vsttrndt,
                            onSaved: (data){
                              completiondate = data;
                            },
                            validator: (data){
                              if(data == ""){
                                return "Please enter valid correct completion date";
                              }
                              return null;
                            }
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    ElevatedButton(onPressed: (){}, child: Text("Submit", style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600
                    ),), style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        backgroundColor: BUTTONCOLOR
                    ),
                    )
                  ],
                ),
              ),
            ),
          ),

        ),
      );
    },
        barrierDismissible: false
    );
  }
  void _validateForm(){
    var state = _formKey.currentState;
    if(state!.validate()){
      state.save();
      //_visitController
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _visitEditingController.dispose();
  }
}
