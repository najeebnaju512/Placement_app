import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../config/app_config.dart';

class ApiHelper {
  static Map<String, String> getApiHeader({String? access, String? dbName}) {
    if (access != null) {
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Token $access'
      };
    } else if (dbName != null) {
      return {
        'Content-Type': 'application/json',
        'dbName': dbName
      };
    } else {
      return {
        'Content-Type': 'application/json',
      };
    }
  }

  static Map<String, String> getApiHeaderForException(
      {String? access, String? dbName}) {
    if (access != null) {
      return {
        // 'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Token $access'
      };
    } else if (dbName != null) {
      return {
        // 'Content-Type': 'application/json',
        'dbName': dbName
      };
    } else {
      return {
        // 'Content-Type': 'application/json',
      };
    }
  }

  static getData({
    required String endPoint,
    Map<String, String>? header,
  }) async {
    log("ApiHelper -> getData()");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("$url");
    try {
      var response = await http.get(url, headers: header);
      log("Api Called => status code=${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        log("Api Helper>>>>>>>${decodedData.toString()}");
        return decodedData;
      } else {
        log("Else Condition >> Api failed");
        return null;
      }
    } catch (e) {
      log("$e");
    }
  }

  static postData({
    required String endPoint,
    Map<String, String>? header,
    Map<String, dynamic>? body,
  }) async {
    log("ApiHelper -> postData()");
    log("body -> $body");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("$url");
    try {
      var response = await http.post(url, body: body, headers: header);
      log("Api Called -> status code:${response.statusCode}");
      if (response.statusCode == 200) {
        var data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        log("Else Condition -> Api failed");
        var data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      }
    } catch (e) {
      log("error  $e");
      rethrow;
    }
  }
}
