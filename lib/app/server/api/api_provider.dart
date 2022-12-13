import 'dart:convert';

import 'package:get/get.dart';
import 'package:kupf/helper/toaster.dart';
import 'package:kupf/presentation/models/service_setup_model.dart';

import '../../../presentation/models/detailed_employee_model.dart';

class ApiProvider extends GetConnect {

  @override
  void onInit() {
    super.onInit();
    Get.log("Testing");
    httpClient.baseUrl = 'https://kupfapi.erp53.com/api';
  }

  Future loginEmployee(String userName, String password) async {
    Map<String, dynamic> data = {
      "username": userName,
      "password": password,
      "tenantId": 21,
      "locationId": 1,
      "userId": 0,
      "token": ""
    };
    try {
      Response response = await post("/Login/EmployeeLogin", data);
      if (response.statusCode == 200) {
        Get.log("Hello");
        // Get.log(response.body);
        return response.body;
      }
      // return null;
    } on Exception catch (e) {
      Toaster.showError(e.toString());
    }
  }

  Future<List<ServiceSetupModel>> getServiceSetup() async {
    try {
      final response = await get("/ServiceSetup/GetServiceSetup");
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
      final response = await get("/ServiceSetup/GetServiceSetupById/$id");
      if (response.statusCode == 200) {
        return ServiceSetupModel.fromJson(json.decode(response.body));
      }
      return null;
    } on Exception catch (e) {
      Toaster.showError(e.toString());
    }
    return null;
  }

  Future<DetailedEmployeeModel?> getEmployeeProfileById(String id) async {
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

  Future updateEmployeeProfile(Map<String, dynamic> data) async {
    try {
      final response = await put("/Employee/UpdateEmployee", data);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        Toaster.showError(response.body.toString());
      }
      return null;
    } on Exception catch (e) {
      Toaster.showError(e.toString());
    }
    return null;
  }
}