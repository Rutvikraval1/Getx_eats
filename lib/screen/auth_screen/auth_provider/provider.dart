
import '../../../service/globle_data.dart';

class Auth_provider{


  //Login Details
  Future<dynamic> getLoginDetails({String phone_number='',String countrycode=''}) async {
    Map data = {
      "countrycode": countrycode,
      "mobile": phone_number
    };
    return await Network()
        .httpClient_request(map_data: data, page_name: 'gen-otp');
  }

  Future<dynamic> getLogout() async {
    Map data = {};
    return await Network()
        .httpClient_request(map_data: data, page_name: 'logout');
  }


  //OTP Verify
  Future<dynamic> getOTP_Verify({String countrycode='',String phone_number='',String otp=''}) async {
    Map data = {
      "countrycode": countrycode,
      "mobile": phone_number,
      "otp": otp
    };
    return await Network()
        .httpClient_request(map_data: data, page_name: 'verify-otp');
  }

  Future<dynamic> add_profile({String firstName='',String lastName='',String email='',String city_name='',String gender=''}) async {
    Map data = {
    "firstName":firstName,
    "lastName": lastName,
    "email": email,
    "city": city_name,
    "gender":gender
    };
    return await Network()
        .httpClient_request(map_data: data, page_name: 'profile');
  }




}