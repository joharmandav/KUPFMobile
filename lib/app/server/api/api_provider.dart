import 'dart:convert';

import 'package:get/get.dart';
import 'package:kupf/presentation/models/service_setup_model.dart';

import '../../../presentation/models/detailed_employee_model.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://kupfapi.erp53.com/api';
  }

  Future loginEmployee(String userName, String password) async {
    Map<String, dynamic> data = {
      "username": userName,
      "password": password,
      "tenantId": 21,
      "locationId": 1,
      "userId": 0,
      "token": "string"
    };
    try {
      Response response = await httpClient.post("/Login/EmployeeLogin", body: data);
      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    } on Exception catch (e) {
      Future.error(e);
    }
  }

  Future<List<ServiceSetupModel>> getServiceSetup() async {
    try {
      final response = await httpClient.get("/ServiceSetup/GetServiceSetup");
      if (response.statusCode == 200) {
        return List<ServiceSetupModel>.from(json.decode(response.body).map((x) => ServiceSetupModel.fromJson(x)));
      }
      return <ServiceSetupModel>[];
    } on Exception catch (e) {
      Future.value(e);
    }
    return <ServiceSetupModel>[];
  }

  Future<ServiceSetupModel?> getServiceSetupById(int id) async {
    try {
      final response = await httpClient.get("/ServiceSetup/GetServiceSetupById/$id");
      if (response.statusCode == 200) {
        return ServiceSetupModel.fromJson(json.decode(response.body));
      }
      return null;
    } on Exception catch (e) {
      Future.value(e);
    }
    return null;
  }

  Future<DetailedEmployeeModel?> getEmployeeProfileById(String id) async {
    try {
      final response = await httpClient.get("/Employee/GetEmployeeById?employeeId=$id");
      if (response.statusCode == 200) {
        return DetailedEmployeeModel.fromJson(json.decode(response.body));
      }
      return null;
    } on Exception catch (e) {
      Future.value(e);
    }
    return null;
  }
}