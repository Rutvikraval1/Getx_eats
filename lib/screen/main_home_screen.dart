
import 'package:eats_app/screen/auth_screen/login_screen.dart';
import 'package:eats_app/utils/custColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../service/pref_manager.dart';
import '../utils/app_locale.dart';
import '../widget/Flutter_toast_mes.dart';
import '../widget/appbar_common.dart';
import '../widget/button/cus_navigateBtn.dart';
import 'Home/home_screen.dart';
import 'auth_screen/auth_provider/provider.dart';

class main_home_screen extends StatefulWidget {
  const main_home_screen({super.key});

  @override
  State<main_home_screen> createState() => _main_home_screenState();
}

class _main_home_screenState extends State<main_home_screen> {
  int _currentIndex = 0;
  List<Widget> getBody = [
     home_screen(),
     Container(color: Colors.grey,),
     Container(color: Colors.pink,),
     Container(color: Colors.red,
     child: SizedBox(
       child: cus_navigateBtn(
         onPressed: () async {
           var logout_data= await Auth_provider().getLogout();
           if(logout_data!=null){
             print("login_data");
             print(logout_data);
             if(logout_data['status']){
               print("login_data");
               print(logout_data);
               await Preferences.clearAllValuesSF();
               Flutter_toast_mes().Error_Message(logout_data['msg']);
               Get.to(login_screen());
             }else{
               Flutter_toast_mes().Error_Message(logout_data['msg'],error_code: true);
             }
           }else{
             Flutter_toast_mes().Error_Message(Tost_meassage.tryAgain,error_code: true);
           }
         },
         text: 'Logout',
       ),
     ),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(),
      body: getBody[_currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
          child: _buildBottomBar(context),
        )
    );
  }
  Widget _buildBottomBar(BuildContext context) {
    return GNav(
        gap: 8, // the tab button gap between icon and text
        color: Colors.grey, // unselected icon color
        activeColor: Colors.white, // selected icon and text color
        iconSize: 24, // tab button icon size
        tabBackgroundColor: Color(0xff00CF63),
        backgroundColor: AppColors.whiteColorf8f8,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
        selectedIndex: _currentIndex,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },// navigation bar padding
        tabs: [
          GButton(
            icon:Icons.home,
            text: 'Explore',
          ),
          GButton(
            icon: Icons.search,
            text: 'Likes',
          ),
          GButton(
            icon: Icons.near_me,
            text: 'Search',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Profile',
          )
        ]
    );
  }
}

