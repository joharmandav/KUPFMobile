import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:kupf_mobile/helper/toaster.dart';
import 'package:kupf_mobile/presentation/controller/main/general_controller.dart';
import 'package:kupf_mobile/presentation/models/service_setup_model.dart';

import '../../../presentation/models/detailed_employee_model.dart';
import '../../../presentation/models/offers_model.dart';

class ApiProvider extends GetConnect {

  @override
  void onInit() {
    super.onInit();
    Get.log("Testing");

    httpClient.baseUrl = 'https://api.kupfkw.com/api';
    httpClient.addAuthenticator((Request request) async {
      request.headers["Authorization"] = "Bearer ${Get.find<GeneralController>().readData("token")}";
      return request;
    });
  }

  Future getEmployeeSync(String employeeId,int teantId,int locationId)async{
  try{
    Response response = await get("/Common/GetEmployeeSynchronization?EmployeeId=$employeeId&TeantId=$teantId&LocationId=$locationId");
    if(response.statusCode == 200){
    return response.body;
    }else{
      print("Employee Sync Failed");
    }
   
   }on Exception catch(e){
     Toaster.showError(e.toString());
   }
  }

  Future loginEmployee(String userName, String password,String type) async {
    Map<String, dynamic> data = {
      "username": userName,
      "password": password,
      "Type": type,
     
    };
    try {
      Response response = await post("/Login/MobileLogin", data);
      if (response.statusCode == 200) {
  
     

        //  save bearer token
        String token = response.body['token'];
        print("TOKEN>>>>>: $token");
       final generalController = Get.find<GeneralController>();
       await generalController.saveBearerToken(token);

      return response.body;
      }
      // return null;
    } on Exception catch (e) {
      Toaster.showError(e.toString());
    }
  }

  Future<List<ServiceSetupModel>> getServiceSetup() async {
    try {
      final response = await get("/ServiceSetup/GetServiceSetup",);
      if (response.statusCode == 200) {
        return List<ServiceSetupModel>.from(response.body.map((x) => ServiceSetupModel.fromJson(x)));
      }
      return <ServiceSetupModel>[];
    } on Exception catch (e) {
      Toaster.showError(e.toString());
    }
    return <ServiceSetupModel>[];
  }

  Future<ServiceSetupModel?> getServiceSetupById(int id) async {
    try {
      final response = await get("/ServiceSetup/GetServiceSetupById/$id",);
      if (response.statusCode == 200) {
        return ServiceSetupModel.fromJson(json.decode(response.body));
      }
      return null;
    } on Exception catch (e) {
      Toaster.showError(e.toString());
    }
    return null;
  }

  Future<DetailedEmployeeModel?> getEmployeeProfileById(int id) async {
    try {
      final response = await get("/Employee/GetEmployeeById?employeeId=$id");
      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> data = response.body;
        return DetailedEmployeeModel.fromJson(data);
      }
      return null;
    } on Exception catch (e) {
      Future.value(e);
    }
    return null;
  }

  Future<dynamic> updateEmployeeProfile(Map<String, dynamic> data, String bearerToken) async {
  try {
    final headers = {
      'Authorization': 'Bearer $bearerToken',
      'Content-Type': 'application/json',
    };
    print("BEARER TOKEN SENDING>>>>: $bearerToken");

    final response = await put(
      "/Employee/UpdateEmployee",
      data,
      headers: headers, 
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      Toaster.showError(response.body.toString());
      print("ERROR >>>>: ${response.body.toString()}");
    }
  } on Exception catch (e) {
    Toaster.showError(e.toString());
  }
  return null;
}


  Future<List<OffersModel>> getOffers() async {
    try {
      final response = await get("/Offers/GetOffers");
      Get.log(response.body.toString());
      if (response.statusCode == 200) {
        return ServiceSetupDto.fromJson(response.body).serviceSetupDto;
      } else {
        Toaster.showError(response.body.toString());
      }
      return <OffersModel>[];
    } on Exception catch (e) {
      Toaster.showError(e.toString());
    }
    return <OffersModel>[];
  }

  Future<OffersModel?> getOfferById(int id) async {
    try {
      final response = await get("/Offers/GetOfferById/$id");
      if (response.statusCode == 200) {
        return OffersModel.fromJson(response.body);
      } else {
        Toaster.showError(response.body.toString());
      }
    } on Exception catch (e) {
      Toaster.showError(e.toString());
    }
    return null;
  }
}