import 'package:dust_check/model/stat_model.dart';
import 'package:dust_check/model/status_models.dart';
import 'package:dust_check/utils/data.utils.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final String region;
  final StatusModel status;
  final StatModel stat;

  const MainAppBar({
    required this.region,
    required this.status,
    required this.stat,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const ts = TextStyle(
      //자주 쓸 것 같은 text색을 final로 지정하여 필요할때 불러온다.
      color: Colors.white,
      fontSize: 30.0,
    );
    return SliverAppBar(
      backgroundColor: status.primaryColor,
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
                  region,
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  DataUtils.getTimeFromDateTime(dateTime: stat.dataTime),
                  style: ts.copyWith(fontSize: 20.0),
                ),
                const SizedBox(height: 20.0),
                Image.asset(
                  status.imagePath,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Text(
                  status.label,
                  style:
                      ts.copyWith(fontSize: 40.0, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  status.Comment,
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
