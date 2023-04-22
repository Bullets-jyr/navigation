import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';

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
      ],
    );
  }
}
