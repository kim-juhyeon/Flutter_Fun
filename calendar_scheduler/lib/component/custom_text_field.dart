import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String lable;
  // true - 시간 / flase - 내용
  final bool isTime;
  const CustomTextField({required this.isTime, required this.lable, Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          lable,
          style: TextStyle(
            color: PRIMAY_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (isTime) renderTextField(),
        if (!isTime)
          Expanded(
            child: renderTextField(),
          )
      ],
    );
  }

  Widget renderTextField() {
    return TextField(
      cursorColor: Colors.grey,
      //커서가 깜빡이는 색깔 조정
      //keyboardType =numer 일경우 해당 부분은 키보드 부분이 숫자형태로 입력이 가능하게 된다.
      maxLines: isTime ? 1 : null,
      /* isTime을 bool값으로 넣어 줬고, 숫자이면 1줄 , 아니면 null값으로 줄바꿈으로 무한히 작성할 수 있음*/
      expands: !isTime,
      keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
      inputFormatters: isTime
          ? [
              FilteringTextInputFormatter.digitsOnly,
              //숫자만 입력을 받음
            ]
          : [],
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
        //input으로 들어가는 부분 색깔 조정
      ),
    );
  }
}
