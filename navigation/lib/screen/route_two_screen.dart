import 'package:flutter/material.dart';

import '../layout/main_layout.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    // modelRoute는 저넻
    return MainLayout(
      title: 'Route Two',
      children: [
        Text(
          'arguments: $arguments',
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
            ); //main.dart에서 작성했던, route name을 불러올 수 있다.
          },
          child: Text('push Named'),
        ),
        ElevatedButton(
          onPressed: () {
            //
            Navigator.of(context).pushReplacementNamed(
              '/three',
            );
          },
          child: Text('psuh Replacement'),
        ),
      ],
    );
  }
}
//arguments 는 pop,push 진행시 인자 값을 같이 전달 할 수 있게 하는 함수이다.
//pushNamed 를 이용하면 arguments를 이용할 수 있음 바로!
//pushReplacementNamed 의 경우 two -> three 그리고 three -> two 'pop'할 경우에는 two가 사라짐