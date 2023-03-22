import 'package:flutter/material.dart';

class NumberRow extends StatelessWidget {
  final int number;
  const NumberRow({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number //onchanged가 double을 받기 때문에 .toint로 변경을 해줘야 한다.
          .toString()
          .split('')
          .map(
            (e) => Image.asset(
              'asset/img/$e.png',
              width: 50.0,
              height: 70.0,
            ),
          )
          .toList(),
    );
  }
}
