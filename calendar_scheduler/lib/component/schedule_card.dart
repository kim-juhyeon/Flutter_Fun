import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final int startTime;
  final int endTime;
  final String content;
  final Color color;

  const ScheduleCard(
      {required this.startTime,
      required this.endTime,
      required this.content,
      required this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: PRIMAY_COLOR),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            children: [
              _Time(startTime: startTime, endTime: endTime),
              SizedBox(
                width: 16.0,
              ),
              _Content(content: content),
              SizedBox(
                width: 16.0,
              ),
              _Category(color: color)
            ],
          ),
        ),
      ),
    );
  }
}

class _Time extends StatelessWidget {
  final int startTime;
  final int endTime;

  const _Time({required this.startTime, required this.endTime, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textstyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: PRIMAY_COLOR,
      fontSize: 16.0,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${startTime.toString().padLeft(2, '0')}:00',
          style: textstyle,
        ),

        /* padleft를 2글자만 유지고 하고, 2개보다 적으면 어떤 것을 채우지에 대해서는 ,0으로 0을 채울 수 있다 (남는 공간을 0으로 채운다.) */
        Text('${endTime.toString().padLeft(2, '0')}:00',
            style: textstyle.copyWith(fontSize: 10.0))
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final String content;
  const _Content({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(content),
    );
  }
}

class _Category extends StatelessWidget {
  final Color color;
  const _Category({required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width: 16.0,
      height: 16.0,
    );
  }
}
