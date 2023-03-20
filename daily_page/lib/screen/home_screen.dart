import 'package:flutter/cupertino.dart'; //ios와 비슷한 디자인을 불러올때 이용하는 패키지이다.
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: const [
              _TopPart(),
              _BottomPart(), //상단 위젯들이 지저분하므로 정리 한 것 -> 이후 칼럼이므로 wrap colum을 진행
            ],
          ),
        ),
      ),
    );
  }
}

class _TopPart extends StatelessWidget {
  const _TopPart();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'U&I',
            style: TextStyle(
                color: Colors.white, fontFamily: 'parisienne', fontSize: 80.0),
          ),
          Column(
            //하나의 위젯으로 판단을 한다. 최상위 칼럼에서는.
            children: const [
              Text(
                '우리 처음 만난날',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'sunflower',
                    fontSize: 30.0),
              ),
              Text(
                '2022.2.1',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'sunflower',
                    fontSize:
                        20.0), //우리 처음 만난 날 , 그리고 Text 가 붙어 있으므로 같이 묶어서 진행을 한다. column -> children
              ),
            ],
          ),
          IconButton(
            iconSize: 60.0,
            onPressed: () {
              showCupertinoDialog(
                context: context,
                barrierDismissible:
                    true, //컨테이너가 생성될 때 종료할 수 있는 버튼 (컨테이너 밖에를 클릭하면 종료가 됨)
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
                        onDateTimeChanged: (DateTime date) {
                          print(date);
                        },
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          const Text('D+1',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'sunflower',
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
              )),
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
