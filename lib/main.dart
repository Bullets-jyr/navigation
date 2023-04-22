import 'package:flutter/material.dart';
import 'package:navigation/screen/home_screen.dart';
import 'package:navigation/screen/route_one_screen.dart';
import 'package:navigation/screen/route_three_screen.dart';
import 'package:navigation/screen/route_two_screen.dart';

const HOME_ROUTE = '/';

void main() {
  runApp(
    MaterialApp(
      // home: HomeScreen(),
      initialRoute: '/',
      // www.google.com -> www.google.com/
      // routes를 설정하였다고 하더라도, 기존에 사용했던 MaterialPageRoute push 방식을
      // 사용할 수 없는 건 아닙니다. 다만, 기능이 하나가 추가가됩니다.
      routes: {
        HOME_ROUTE: (context) => HomeScreen(),
        '/one': (context) => RouteOneScreen(),
        '/two': (context) => RouteTwoScreen(),
        '/three': (context) => RouteThreeScreen(),
      },
    ),
  );
}
