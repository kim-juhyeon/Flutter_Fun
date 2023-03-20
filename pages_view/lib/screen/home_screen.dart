import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //timer - 지속적으로 진행할 때,
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );
  //state에 컨트롤러를 생성하여 초기 페이지 0을 입력한다. -> 알아서 build에 있는 0번째 page를 찾는다.

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      if (nextPage > 4) {
        nextPage = 0; //사진 4장이 넘어가면 다시 초기화 알고리즘
      }
      controller.animateToPage(nextPage,
          duration: const Duration(microseconds: 400),
          curve: Curves.linear); //curve.linear 처음부터 끝까지 동일하게 움직임
    });
  }

  @override
  void dispose() {
    controller.dispose(); //controller 가 사라질때 dispose를 불러오면 메모리를 안전하게 이용할 수 있음.
    if (timer != null) {
      timer!.cancel();
    } //타이머가 null이 아닐때 타이머를 취소한다.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [1, 2, 3, 4, 5]
            .map(
              (e) => Image.asset(
                'asset/img/image_$e.jpeg',
                fit: BoxFit.cover,
              ),
            )
            .toList(), //children은 리스트로 받기 때문에 마지막은 to list를 해야한다.
        // eum을 하지 않을경우 코드가 굉장히 길어 지기 때문에 image 1,2,3,4,5만 다른 부분 map알고리즘을 작성한다.
      ),
    );
  }
}
