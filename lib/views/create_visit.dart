import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sc_pharma_app/widgets/colors.dart';

import '../controller/visit_schueduele_controller.dart';
import '../models/visit_model.dart';
import '../widgets/navigation_drawer.dart';

class CreateVisitForm extends StatefulWidget {
  String? userId,userName;

  CreateVisitForm(String userId, String userName){
    this.userId = userId;
    this.userName = userName;
  }
  @override
  State<CreateVisitForm> createState() => _CreateVisitFormState();
}

class _CreateVisitFormState extends State<CreateVisitForm> {
  VisitController _visitController = VisitController();
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

  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      _visitController.getVisitData();
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
          title: Text('New Visit',style: GoogleFonts.openSans(
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
          decoration: BoxDecoration(
            gradient: CARDGRADIENT
          ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: GetBuilder<VisitController>(
                  init: _visitController,
                  builder: (ctx) {
                    return _visitController.getIsDataFetched ? Column(
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
                                  labelStyle: TextStyle(color: Colors.white),
                                  labelText: "Visit no"
                              ),
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
                            child: DropdownSearch<String>(
                              items: _visitController.getClinicLov(),
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                baseStyle: TextStyle(color: Colors.white),
                                dropdownSearchDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Clinics",
                                  labelStyle: TextStyle(
                    color: Colors.white
                    ),
                                ),
                              ),
                              //cursorColor: Colors.white,
                              onSaved: (data){
                                clinic = data;
                              },
                              onChanged: (data){
                                clinic = data;
                              },
                              validator: (data){
                                if(data == ""){
                                  return "Please enter valid correct clinic name";
                                }
                                return null;
                              },
                              popupProps: PopupProps.menu(showSearchBox: true, menuProps: MenuProps(
                                backgroundColor: BUTTONCOLOR,
                              ),
                                itemBuilder: (ctx, item, _){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(item, style: TextStyle(
                                    color: Colors.white
                                  ),),
                                );
                                },
                                emptyBuilder: (ctx, st){
                                return Container(
                                  width: size.width,
                                  alignment: Alignment.center,
                                  child: Text("No data found", style: TextStyle(
                                    color: Colors.white
                                  ),),
                                );
                                },
                                searchFieldProps: TextFieldProps(
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.search,
                                    color: Colors.white,
                                    ),
                                    labelText: "Search Clinic",
                                    labelStyle: TextStyle(
                                      color: Colors.white
                                    )
                                  )
                                ),
                              ),

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
                            child: DropdownSearch<String>(
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Search Doctor",
                                  labelStyle: TextStyle(
                                    color: Colors.white
                                  )
                                ),
                                baseStyle: TextStyle(color: Colors.white)
                              ),
                              items: _visitController.getDoctorLov(),
                              popupProps: PopupProps.menu(
                                emptyBuilder: (ctx, st){
                                  return Container(
                                    width: size.width,
                                    alignment: Alignment.center,
                                    child: Text("No data found", style: TextStyle(
                                        color: Colors.white
                                    ),),
                                  );
                                },
                                searchFieldProps: TextFieldProps(
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    labelText: "Search Doctor",
                                    labelStyle: TextStyle(
                                      color: Colors.white
                                    )
                                  )
                                ),
                                showSearchBox: true,
                                menuProps: MenuProps(
                                  backgroundColor: BUTTONCOLOR
                                ),
                                itemBuilder: (ctx, item, _){
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(item, style: TextStyle(color: Colors.white),),
                                  );
                                }
                              ),
                            )
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
                            child: DropdownSearch<String>(
                              items: _visitController.getVisitTypeLov(),
                              popupProps: PopupProps.menu(
                                menuProps: MenuProps(
                                  backgroundColor: BUTTONCOLOR,
                                ),
                                showSearchBox: true,
                                searchFieldProps: TextFieldProps(
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Search Visit Type",
                                    labelStyle: TextStyle(
                                      color: Colors.white
                                    ),
                                    suffixIcon: Icon(Icons.search, color: Colors.white,)
                                  ),
                                ),
                                itemBuilder: (ctx, item, _){
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(item,
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                    ),
                                  );
                                },
                                emptyBuilder: (ctx, item){
                                  return Container(
                                    width: size.width,
                                    alignment: Alignment.center,
                                    child: Text("No data found",
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                    ),
                                  );
                                }
                              ),
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                baseStyle: TextStyle(
                                  color: Colors.white
                                ),
                                dropdownSearchDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Visit Type",
                                  labelStyle: TextStyle(
                                    color: Colors.white
                                  )
                                )
                              ),
                            )
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
                                }
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
                            child: DropdownSearch<String>(
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: "Visit Result",
                                      labelStyle: TextStyle(
                                          color: Colors.white
                                      )
                                  ),
                                  baseStyle: TextStyle(color: Colors.white)
                              ),
                              items: _visitController.getVisitResultLov(),
                              popupProps: PopupProps.menu(
                                  emptyBuilder: (ctx, st){
                                    return Container(
                                      width: size.width,
                                      alignment: Alignment.center,
                                      child: Text("No data found", style: TextStyle(
                                          color: Colors.white
                                      ),),
                                    );
                                  },
                                  searchFieldProps: TextFieldProps(
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                      decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.search,
                                            color: Colors.white,
                                          ),
                                          labelText: "Search Visit Result",
                                          labelStyle: TextStyle(
                                              color: Colors.white
                                          )
                                      )
                                  ),
                                  showSearchBox: true,
                                  menuProps: MenuProps(
                                      backgroundColor: BUTTONCOLOR
                                  ),
                                  itemBuilder: (ctx, item, _){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(item, style: TextStyle(color: Colors.white),),
                                    );
                                  }
                              ),
                            )
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
                    ) :
                    Center(
                      child: Text("Loading..."),
                    );
                  }
                ),
              ),
            )
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _visitController.dispose();
  }
}
