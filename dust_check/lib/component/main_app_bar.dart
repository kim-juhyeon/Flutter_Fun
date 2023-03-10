import 'package:flutter/material.dart';

import '../const/colors.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const ts = TextStyle(
      //자주 쓸 것 같은 text색을 final로 지정하여 필요할때 불러온다.
      color: Colors.white,
      fontSize: 30.0,
    );
    return SliverAppBar(
      backgroundColor: primaryColor,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          //Safe Area를 통해 노치에 가려져 있는 부분을 해소 '서울'
          child: Container(
            margin: const EdgeInsets.only(
                top:
                    kToolbarHeight), //safeArea로 지정했던 부분을 제외하고 marging의 구역을 정해 줄 수 있음 "kToolbarHeight:

            child: Column(
              children: [
                Text(
                  '서울',
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  DateTime.now().toString(),
                  style: ts.copyWith(fontSize: 20.0),
                ),
                const SizedBox(height: 20.0),
                Image.asset(
                  'asset/img/mediocre.png',
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Text(
                  '보통',
                  style:
                      ts.copyWith(fontSize: 40.0, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  '나쁘지 않네요!',
                  style:
                      ts.copyWith(fontSize: 20.0, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
