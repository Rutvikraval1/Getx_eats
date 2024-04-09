
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../service/pref_manager.dart';
import '../../../service/provider/provider.dart';
import '../../../utils/app_locale.dart';
import '../../../widget/Flutter_toast_mes.dart';

class HomeController extends GetxController
    with StateMixin<dynamic> {
  List Slider_list=[];
  List cafe_name=[];
  List uid=[];
  List logo_image_id=[];
  List closing_time=[];
  List<int> starting_price=[];
  List<int> google_rating_count=[];
  List<double> avg_google_rating=[];



  @override
  void onInit() {
    // TODO: implement onInit
    print(Preferences.getStringValuesSF(Preferences.user_token));
    get_slider();
    getCafe_list();
    super.onInit();
  }

  Future<void> get_slider() async {
    try{
      var get_slider= await Provider().getSlider();
      print('get_slider');
      print(get_slider);
      if(get_slider['success']){
        Slider_list=[];
        List data=get_slider['data'];
        for(int i=0;i<data.length;i++){
          Slider_list.add(data[i]['banner_image_id']);
        }
        print("Slider_list");
        print(Slider_list);
      }else{
        Flutter_toast_mes().Error_Message(get_slider['msg'],error_code: true);
      }
    }catch(e){
      print(e);
    }
  }

  Future<void> getCafe_list() async {
    try{
      var getCafeList= await Provider().getCafeList(longitude: '82.1997954',latitude: '26.7921605',city: 'Bhilwara');
      print('getCafeList');
      print(getCafeList);
      if(getCafeList['status']){
        cafe_name=[];
        uid=[];
        logo_image_id=[];
        closing_time=[];
        starting_price=[];
        google_rating_count=[];
        avg_google_rating=[];
        List data=getCafeList['data'];
        for(int i=0;i<data.length;i++){
          cafe_name.add(data[i]['cafe_name']??'');
          uid.add(data[i]['uid']??'');
          logo_image_id.add(data[i]['logo_image_id']??'');
          closing_time.add(data[i]['closing_time']??'');
          starting_price.add(data[i]['starting_price']??0);
          google_rating_count.add(data[i]['google_rating_count']??0);
          avg_google_rating.add(data[i]['avg_google_rating']??0);
        }
        change(data, status: RxStatus.success());
      }else{
        Flutter_toast_mes().Error_Message(getCafeList['msg'],error_code: true);
        change(getCafeList, status: RxStatus.empty());
      }
    }catch(e){
      print(e);
    }

  }


}