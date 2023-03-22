import 'package:flutter/material.dart';
import 'package:random_page/component/number_row.dart';
import 'package:random_page/constant/color.dart';

class SettingScreen extends StatefulWidget {
  final int maxNumber;

  const SettingScreen({required this.maxNumber, Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000; //처음 시작할때는 1000이 초기화면
//settingScreenState가 재생성 될때 initState가 생성된다.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    maxNumber = widget.maxNumber.toDouble();
  } // 초기화면 이후 initState가 실행된다. 다시 말해 onpressed가 실행된 이후

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(maxNumber: maxNumber),
              _Footer(
                maxNumber: maxNumber,
                onSilderChanged: onSilderChanged,
                onButtonPressed: onButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSilderChanged(double val) {
    setState(() {
      maxNumber = val;
    });
  }

  void onButtonPressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;
  const _Body({
    required this.maxNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(
        number: maxNumber.toInt(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double>? onSilderChanged;
  final VoidCallback onButtonPressed;

  const _Footer({
    required this.maxNumber,
    required this.onSilderChanged,
    required this.onButtonPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNumber,
          min: 1000,
          max: 10000,
          onChanged: onSilderChanged,
        ),
        ElevatedButton(
          onPressed: onButtonPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: RED_COLOR,
          ),
          child: Text('저장'),
        ),
      ],
    );
  }
}
