import 'package:flutter/cupertino.dart'; //ios와 비슷한 디자인을 불러올때 이용하는 패키지이다.
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _TopPart(
                selectedDate: selectedDate,
                onPressd: onHeartPressed,
              ),
              const _BottomPart(), //상단 위젯들이 지저분하므로 정리 한 것 -> 이후 칼럼이므로 wrap colum을 진행
            ],
          ),
        ),
      ),
    );
  }

  onHeartPressed() {
    final DateTime now = DateTime.now();

    showCupertinoDialog(
      context: context,
      barrierDismissible: true, //컨테이너가 생성될 때 종료할 수 있는 버튼 (컨테이너 밖에를 클릭하면 종료가 됨)
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment
              .bottomCenter, //flutter의 특징으로 컨테이너를 dialog를 따로 설정해주지 않으면 공간을 전부 덮어버리게 되므로
          //align으로 정리를 알려줘야 한다.
          child: Container(
            color: Colors.white,
            height: 300.0,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate, //초기 설정값으로 지정
              maximumDate: DateTime(
                //미래 시간을 설정에 제한을 두기 위해 maimumDate를 설정
                now.year,
                now.month,
                now.day,
              ),
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  //빌드를 다시 할때 변수가 변경 될  때는 setState
                  selectedDate = date;
                });
                print(date);
              },
            ),
          ),
        );
      },
    );
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressd; //현재 onpreed가 setate애 속해 있으므로 onpressd 전체를
  //stelesswidget으로 종속 시키기 위해 상위 포지션 voidcallback을 지정해준다
  const _TopPart({required this.selectedDate, required this.onPressd, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); //of 공부가 필요..
    final textTheme = theme.textTheme;
    final now = DateTime.now(); // DateTime 변수명이 길기 때문에 now로 대체

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U&I',
            style: textTheme.displayLarge,
          ),
          Column(
            //하나의 위젯으로 판단을 한다. 최상위 칼럼에서는.
            children: [
              Text(
                '우리 처음 만난날',
                style: textTheme.displaySmall,
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: textTheme.bodySmall,
                //우리 처음 만난 날 , 그리고 Text 가 붙어 있으므로 같이 묶어서 진행을 한다. column -> children
              ),
            ],
          ),
          IconButton(
            iconSize: 60.0,
            onPressed: onPressd,
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Text(
            'D+${DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).difference(selectedDate).inDays + 1}',
            style: textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'asset/img/middle_image.png',
      ),
    );
  }
}
