import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;

  const RouteOneScreen({
    Key? key,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Route One',
      children: [
        ElevatedButton(
          onPressed: () {
            print(Navigator.of(context).canPop());
          },
          child: Text('Can Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            // 뒤로 갈 수 있는 route가 없을 경우, 뒤로 가기를 할 수 없습니다.
            // Navigator.of(context).canPop()의 반환값이 true일 경우 Pop이 가능합니다.
            Navigator.of(context).maybePop();
          },
          child: Text('Maybe Pop'),
        ),
        Text(
          'arguments : ${number.toString()}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text('Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            // Route Stack
            // [HomeScreen(), RouteOne(), RouteTwo()]
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RouteTwoScreen(),
                settings: RouteSettings(
                  arguments: 789
                ),
              ),
            );
          },
          child: Text('Push'),
        ),
      ],
    );
  }
}
