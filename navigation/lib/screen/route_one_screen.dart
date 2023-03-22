import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;
  const RouteOneScreen({
    this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      //이미 mainLayout에서 정렬을 했지만, 넘어어오는 숫자는 적용이 되지 않는다.
      title: 'Route One',
      children: [
        Text(
          'arguments : ${number.toString()}',
          textAlign: TextAlign.center, //home_screen에서 넘어온 숫자를 정렬
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text('pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RouteTwoScreen(),
                settings: RouteSettings(arguments: 789),
              ),
            );
          },
          child: Text('psuh'),
        )
      ],
    );
  }
}
