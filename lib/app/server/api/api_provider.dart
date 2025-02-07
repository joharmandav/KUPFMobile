import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kupf_mobile/helper/toaster.dart';
import 'package:kupf_mobile/presentation/controller/main/general_controller.dart';
import '../../../presentation/controller/login/login_controller.dart';
import '../../../presentation/models/login_response_model.dart';
import '../../../presentation/models/offers_model.dart';
import '../../../presentation/models/serviceSetup_model.dart';
import '../database/database_helper.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends GetConnect {
  final storageBox = GetStorage();

  @override
  void onInit() {
    super.onInit();
    Get.log("Testing");

    httpClient.baseUrl = 'https://api.kupfkw.com/api';
    httpClient.addAuthenticator((Request request) async {
      request.headers["Authorization"] =
          "Bearer ${Get.find<GeneralController>().readData("token")}";
      return request;
    });
  }

  Future getEmployeeSync(
      String employeeId, int teantId, int locationId, String token) async {
    try {
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      Response response = await get(
          "/Common/GetEmployeeSynchronization?EmployeeId=$employeeId&TeantId=$teantId&LocationId=$locationId",
          headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.body;
        var detEmpData = responseData['detailedEmployee'] ?? [];
        var transHd = responseData['transactionHD'] ?? [];
        var transDt = responseData['transactionDT'] ?? [];
        var refTble = responseData['refTable'] ?? [];
        var servStp = responseData['serviceSetup'] ?? [];
        var webPge = responseData['webPages'] ?? [];
        var webPUrl = responseData['webPageUrl'] ?? [];
        var webCnt = responseData['webContent'] ?? [];
        var fucMst = responseData['functioN_MST'] ?? [];
        var fucUsr = responseData['functioN_USER'] ?? [];
        var trasDtSubMon = responseData['transDTSubMonthly'] ?? [];
        var trnsHddAproDetail =
            responseData['transactionHddapprovalDetail'] ?? [];
        var trnsHddm = responseData['transactionHddm'] ?? [];
        Map<String, dynamic> dataInsertion = {
          'detailedEmployee': detEmpData,
          'transactionHD': transHd,
          'transactionDT': transDt,
          'refTable': refTble,
          'serviceSetup': servStp,
          'webPages': webPge,
          'webPageUrl': webPUrl,
          'webContent': webCnt,
          'functioN_MST': fucMst,
          'functioN_USER': fucUsr,
          'transDTSubMonthly': trasDtSubMon,
          'transactionHddapprovalDetail': trnsHddAproDetail,
          'transactionHddm': trnsHddm,
        };

        await DatabaseHelper().insertDetailedEmployeeData(dataInsertion);
        // await DatabaseHelper().insertransactionHdData(dataInsertion);
        // await DatabaseHelper().inserttransactionDTData(dataInsertion);
        // await DatabaseHelper().insertrefTableData(dataInsertion);
        // await DatabaseHelper().insertwebPagesData(dataInsertion);
        // await DatabaseHelper().insertWebPageUrlData(dataInsertion);
        // await DatabaseHelper().insertWebContentData(dataInsertion);
        // await DatabaseHelper().insertCrupAuditData(dataInsertion);
        // await DatabaseHelper().insertFuctionMstData(dataInsertion);
        // await DatabaseHelper().insertfunctionUsrData(dataInsertion);
        // await DatabaseHelper().insertTransDtSubMonData(dataInsertion);
        // await DatabaseHelper().insertTrnsHdAproDetailsData(dataInsertion);
        // await DatabaseHelper().insertTrnsHddMData(dataInsertion);
        // await DatabaseHelper().insertServiceSetupData(dataInsertion);
        // await DatabaseHelper().insertTrnsHddMData(dataInsertion);
        // await DatabaseHelper().insertTrnsHddMData(dataInsertion);

        // Get.log(responseData.toString());

        return responseData;
      } else {
        print("Employee Sync Failed");
      }
    } on Exception catch (e) {
      Toaster.showError(e.toString());
    }
    return null;
  }

  Future loginEmployee(String userName, String password, String type) async {
    final LoginController loginController = Get.find<LoginController>();

    bool rememberUser = loginController.rememberMe.value;

    Map<String, dynamic> data = {
      "username": userName,
      "password": password,
      "type": type,
    };
    print("LOGIN PAYLOAD : $data");
    try {
      final controller = Get.find<GeneralController>();

      Response response = await post("/Login/MobileLogin", data);

      if (response.statusCode == 200) {
        if (rememberUser) {
          controller.storageBox.write('username', userName);
          controller.storageBox.write('password', password);
          controller.storageBox.write('rememberMe', true);
        }

        Map<String, dynamic> responseBody = response.body;
        // LoginResModel employee = LoginResModel.fromJson(responseBody);
        // Retrieve and print the stored data
        List<Map<String, dynamic>> savedData = await DatabaseHelper().getData();
        print("SQFLITE DATABASE STORED : >> $savedData");

        //  save bearer token
        String token = response.body['token'];
        print("TOKEN>>>>>: $token");
        final generalController = Get.find<GeneralController>();
        await generalController.saveBearerToken(token);

        return responseBody;
      } else {
        controller.storageBox.remove('username');
        controller.storageBox.remove('password');
        controller.storageBox.write('rememberMe', false);
      }
      // return null;
    } on Exception catch (e) {
      Toaster.showError(e.toString());
    }
  }


  Future<List<ServiceSetupModel>> getServiceSetup() async {
    try {
      final response = await get("/ServiceSetup/GetServiceSetup");


      print("Response body: ${response.body}");

      dynamic responseData;

      if (response.body is String) {

        responseData = jsonDecode(response.body);
      } else {
        responseData = response.body;
      }

      if (responseData is List) {
        return responseData.map((x) => ServiceSetupModel.fromJson(x)).toList();
      } else if (responseData is Map<String, dynamic>) {

        if (responseData.containsKey('data')) {
          final listData = responseData['data'];
          if (listData is List) {
            return listData.map((x) => ServiceSetupModel.fromJson(x)).toList();
          }
        }
        return [ServiceSetupModel.fromJson(responseData)];
      } else {
        throw Exception("Unexpected response format: ${response.body}");
      }
    } catch (e) {
      print("Error: $e"); // Debugging log
      Toaster.showError(e.toString());
    }
    return <ServiceSetupModel>[];
  }



  Future<ServiceSetupModel?> getServiceSetupById(int id) async {
    try {
      final response = await get(
        "/ServiceSetup/GetServiceSetupById/$id",
      );
      if (response.statusCode == 200) {
        return ServiceSetupModel.fromJson(json.decode(response.body));
      }
      return null;
    } on Exception catch (e) {
      Toaster.showError(e.toString());
    }
    return null;
  }

  Future<LoginResModel?> getEmployeeProfile(id) async {
    try {
      final headers = {
        'Authorization':
            'Bearer ${Get.find<GeneralController>().readData("token")}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      final response = await http.get(
        Uri.parse(
            "https://api.kupfkw.com/api/Employee/GetEmployeeById?employeeId=$id"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        LoginResModel employee =
            LoginResModel.fromJson(jsonDecode(response.body));

        return employee;
      } else {
        print(
            'Failed to load employee data. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
      Toaster.showError(e.toString());
    }
    return null;
  }



  Future<dynamic> updateEmployeeProfile(
    Map<String, dynamic> data,
  ) async {
    try {
      String? bearerToken = storageBox.read('token');
      final headers = {
        'Authorization': 'Bearer $bearerToken',
        'Content-Type': 'application/json',
      };
      print("BEARER TOKEN SENDING>>>>: $bearerToken");

      final response = await put(
        "/Employee/UpdateMobileEmployee",
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
