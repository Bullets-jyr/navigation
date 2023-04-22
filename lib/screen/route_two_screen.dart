import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // of(context)는 위젯트리에서 가장 가까운 ModalRoute를 가져올 수 있다.
    // ModalRoute는 풀 스크린의 위젯을 이야기 합니다.
    // 즉, RouteTwoScreen에서 위젯트리에서 가장 가까운 플 스크린 라우트는
    // RouteTwoScreen입니다.
    // 다시 말하면 RouteTwoScreen의 값을 가져오는 것입니다.
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: 'Route Two',
      children: [
        Text(
          'arguments: ${arguments}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/three',
              arguments: 999,
            );
          },
          child: Text('Push Named'),
        ),
        // [HomeScreen(), RouteOne(), RouteTwo(), RouteThreeScreen()]
        // 결과 : [HomeScreen(), RouteOne(), RouteThreeScreen()]
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => RouteThreeScreen(),
              ),
            );
          },
          child: Text('Push Replacement'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              '/three',
            );
          },
          child: Text('Push Replacement Named'),
        ),
        // [HomeScreen(), RouteOne(), RouteTwo(), RouteThreeScreen()]
        // 결과 : [HomeScreen()]
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => RouteThreeScreen(),
              ),
              // 우리가 Named Route로 Push를 하지 않은 경우, name이 null일 수도 있습니다.
              // Named Route로 Push를 했다면, 특정 Route까지만 삭제를 할 수 있습니다.
              // false : 해당 route를 스택에서 제거
              (route) => route.settings.name == '/',
            );
          },
          child: Text('Push And Remove Until'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/three',
              (route) => route.settings.name == '/',
            );
          },
          child: Text('Push Named And Remove Until'),
        ),
      ],
    );
  }
}
