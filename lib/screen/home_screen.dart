import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    // Pop 버튼을 만들어 놓았다면 WillPopScope 위젯을 사용하더라도 막을 수는 없습니다.
    // 그러한 상황이 아니라면 시스템에서 뒤로가기 하려는 것을 막을 수는 있습니다.
    return WillPopScope(
      onWillPop: () async {
        // true - pop 가능
        // false - pop 불가능
        // return false;
        // 특정 작업 실행
        final canPop = Navigator.of(context).canPop();
        return canPop;
      },
      child: MainLayout(
        title: 'Home Screen',
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
              Navigator.of(context).maybePop();
            },
            child: Text('Maybe Pop'),
          ),
          // [HomeScreen()]
          // 결과 : []
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Pop'),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RouteOneScreen(
                    number: 123,
                  ),
                ),
              );

              print(result);
            },
            child: Text('Push'),
          ),
        ],
      ),
    );
  }
}
