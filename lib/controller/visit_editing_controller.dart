import 'dart:convert';

import 'package:get/get.dart';

import '../models/visit_model.dart';
import 'package:http/http.dart' as http;
class VisitEditingController extends GetxController{
  VisitModel? _visitModel;
  bool _isDataFetched = false;
  VisitModel? get getModel{
    return _visitModel;
  }
  bool get getIsDataFetched{
    return _isDataFetched;
  }
  getVisitData(String userId) async{
    try{
      var res = await http.get(Uri.http("sc9.indus-erp.com:1251", "/ords/indus6/log/visitschedule", {
        "usrid" : userId
      }));
      if(res.statusCode == 200){
        _visitModel = VisitModel.fromJson(jsonDecode(res.body));
        _isDataFetched = true;
        update();
      }
    }
    catch(e){
      print(e);
    }
  }
}