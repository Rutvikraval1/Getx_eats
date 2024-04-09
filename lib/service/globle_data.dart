
import 'dart:convert';
import 'dart:io';

import 'package:eats_app/service/pref_manager.dart';

import '../utils/app_locale.dart';
import '../widget/Flutter_toast_mes.dart';
class Network {
  /// - PRODUCTION SERVER Call API
  // static const String base_url = "https://app-mobile.a2deats.com";
  /// STAG SERVER Call API
  static const String base_url = "https://app.a2deatsdev.in";
  static const String api_verison = "api/v1";

  Future<dynamic> httpClient_request(
      {required Map map_data, required String page_name,String http_request='POST'}) async {
    try {
      HttpClient httpClient = HttpClient();
      HttpClientRequest? request;
      HttpClientResponse? response;
      if(http_request=="POST"){
        print('response step 1 POST');
        print('$base_url/$api_verison/$page_name');
        print(map_data);
        request = await httpClient.postUrl(Uri.parse("$base_url/$api_verison/$page_name"));
        request.headers.set('content-type', 'application/json');
        if(Preferences.getStringValuesSF(Preferences.user_token)!=null) {
          print('user_token');
          print(Preferences.getStringValuesSF(Preferences.user_token));
          request.headers.set('Authorization', 'Bearer ${Preferences.getStringValuesSF(Preferences.user_token)}');
        }
        request.add(utf8.encode(json.encode(map_data)));
      }else{
        print('response step 1 get');
        request = await httpClient.getUrl(Uri.parse("$base_url/$api_verison/$page_name"));
        request.headers.set('Authorization', 'Bearer ${Preferences.getStringValuesSF(Preferences.user_token)}');
      }
      response = await request.close();
      print('response step 1');
      print(response.statusCode);
      String reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      print('vvxcvcv');
      print(response.statusCode);
      print(reply);
      return json.decode(reply);
      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   return json.decode(reply);
      // }  else {
      //   if (response.statusCode == 404) {
      //     return pageNotFound;
      //   }else if (response.statusCode == 400||response.statusCode == 401) {
      //     return json.decode(reply);
      //   } else {
      //     return server_error;
      //   }
      // }
    } on SocketException {
      Flutter_toast_mes().Error_Message(Tost_meassage.connectInternet,error_code: true);
    } catch (e) {
      print("svcvc");
    }
  }

  Map server_error = {
    'success': false,
    'msg': Tost_meassage.server_error,
  };
  Map pageNotFound = {
    'success': false,
    'msg': Tost_meassage.pageNotFound,
  };
}
