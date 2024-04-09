
import '../globle_data.dart';

class Provider{
  Future<dynamic> getSlider() async {
    Map data = {};
    return await Network()
        .httpClient_request(map_data: data, page_name: 'banners',http_request: 'GET');
  }

  Future<dynamic> getCafeList({String latitude='',String longitude='',String city=''}) async {
    Map data = {};
    String createlink='?latitude=$latitude&longitude=$longitude&city=$city';
    return await Network()
        .httpClient_request(map_data: data, page_name: 'cafe-list$createlink',http_request: 'GET');
  }
}