import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_page/component/number_row.dart';
import 'package:random_page/constant/color.dart';
import 'package:random_page/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNumber = 1000;
  List<int> randomNumbers = [
    //난수 생성학 위해 randomnumber변수를 지정
    123,
    456,
    789,
  ];

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(
                onPressed: onSettingsPop,
              ),
              _Body(
                randomNumbers: randomNumbers,
              ),
              _Footer(onPressed: onRandomNumberGenerate),
            ],
          ),
        ),
      ),
    );
  }

  void onSettingsPop() async {
    //버튼을 눌렀을때 함수가 실행되므로 int? 입력이 필요
    final int? result = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SettingScreen(
            maxNumber: maxNumber,
          );
        },
      ),
    );
    if (result != null) {
      setState(() {
        maxNumber = result;
      });
    }
  }

  void onRandomNumberGenerate() {
    final rand = Random();
    final Set<int> newNumbers = {}; //중복 숫자를 거르기 위해서 set을 진행
    while (newNumbers.length != 3) {
      //while 문을 이용하여 newnumbers의 길이가 3이 될 때까지 진행
      final number = rand.nextInt(maxNumber);

      newNumbers.add(number);
    }
    setState(() {
      randomNumbers = newNumbers.toList();
    });
    //dart.math를 임포트 기본제공//
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;
  const _Header({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          //세팅을 누르고 push로 settingScreen으로 가고, 이후 설정값들이 화면에 돌려 받을때는 async를 해야함. 미래에 돌려 받을 값이기 때문에
          onPressed: onPressed,
          icon: const Icon(
            Icons.settings,
            color: RED_COLOR,
          ),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  List<int> randomNumbers;
  _Body({
    required this.randomNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: randomNumbers
              .asMap()
              .entries //값이 키와 벨류값으로 들오 오는 것
              .map(
                (x) => Padding(
                    padding: EdgeInsets.only(
                        bottom: x.key == 2
                            ? 0
                            : 16.0), //x값이 2일경우에는 0을 넣어주고, 아니면 16pixel을 넣어줘라는 알고리즘
                    child: NumberRow(
                      number: x.value,
                    )),
              )
              .toList()),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;
  const _Footer({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // ElevatedButton 으로 눌렀을때의 반응을 설정해 줄 수 있으며, sizedBoxt로 감싸줘서 사이즈를 변경할 수 있다.
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          //primary : 주색상
          backgroundColor: RED_COLOR,
        ),
        onPressed: onPressed,
        child: Text('생성하기!'),
      ),
    );
  }
}
