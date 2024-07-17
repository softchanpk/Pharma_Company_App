import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sc_pharma_app/models/clinic_lov_model.dart';
import 'package:sc_pharma_app/models/doctor_lov.dart';
import 'package:sc_pharma_app/models/visit_model.dart';
import 'package:sc_pharma_app/models/visit_result_lov.dart';
import 'package:sc_pharma_app/models/visit_type_model.dart';

class VisitController extends GetxController{
  VisitModel? _visitModel;
  DoctorLov? _doctorLovModel;
  ClinicLov? _clinicLovModel;
  VisitResultLov? _visitResultLovModel;
  VisitType? _visitTypeLovModel;
  bool _isDataFetched = false;
  postData(){

  }
  getVisitData() async{
    try{
     var apiFutures = await Future.wait(eagerError: true,
         [
        http.get(Uri.http("sc9.indus-erp.com:1251", "/ords/indus6/log/doctor")),
        http.get(Uri.http("sc9.indus-erp.com:1251", "/ords/indus6/log/clinic")),
        http.get(Uri.http("sc9.indus-erp.com:1251", "/ords/indus6/log/visittype")),
        http.get(Uri.http("sc9.indus-erp.com:1251", "/ords/indus6/log/visitresult"))
      ]);
     for(int i = 0; i < apiFutures.length; i++){
       int statusCode = apiFutures[i].statusCode;
       if(statusCode == 200){
         if(i == 0){
           print("Doctor lov: ${apiFutures[i].body}");
           _doctorLovModel = DoctorLov.fromJson(jsonDecode(apiFutures[i].body));
         }
         else if(i == 1){
           print("Clinic lov: ${apiFutures[i].body}");
           _clinicLovModel = ClinicLov.fromJson(jsonDecode(apiFutures[i].body));
         }
         else if(i == 2){
           print("Visit type lov: ${apiFutures[i].body}");
           _visitTypeLovModel = VisitType.fromJson(jsonDecode(apiFutures[i].body));
         }
         else if(i == 3){
           print("Visit result lov: ${apiFutures[i].body}");
           _visitResultLovModel = VisitResultLov.fromJson(jsonDecode(apiFutures[i].body));
         }
       }
     }
      _isDataFetched = true;
      update();
    }
    catch(e){
      print(e);
    }
  }
  VisitModel? get getModel{
    return _visitModel;
  }
  bool get getIsDataFetched{
    return _isDataFetched;
  }
  DoctorLov? get getDoctorLovModel{
    return _doctorLovModel;
  }
  ClinicLov? get getClinicLovModel{
    return _clinicLovModel;
  }
  VisitResultLov? get getVisitLovModel{
    return _visitResultLovModel;
  }
  List<String> getClinicLov(){
    List<String> clinicLov = [];
    for(int i = 0; i < _clinicLovModel!.items!.length; i++){
      clinicLov.add(_clinicLovModel!.items![i].abkname!);
    }
    return clinicLov;
  }
  List<String> getDoctorLov(){
    List<String> doctorLov = [];
    for(int i = 0; i < _doctorLovModel!.items!.length; i++){
      doctorLov.add(_doctorLovModel!.items![i].d!);
    }
    return doctorLov;
  }
  List<String> getVisitResultLov(){
    List<String> visitResultLov = [];
    for(int i = 0; i < _visitResultLovModel!.items!.length; i++){
      visitResultLov.add(_visitResultLovModel!.items![i].d!);
    }
    return visitResultLov;
  }
  List<String> getVisitTypeLov(){
    List<String> visitTypeLov = [];
    for(int i = 0; i < _visitTypeLovModel!.items!.length; i++){
      visitTypeLov.add(_visitTypeLovModel!.items![i].d!);
    }
    return visitTypeLov;
  }
}