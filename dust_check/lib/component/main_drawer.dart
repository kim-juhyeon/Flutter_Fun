import 'package:dust_check/const/colors.dart';
import 'package:flutter/material.dart';

const regions = [
  '서울',
  '경기',
  '대구',
  '충남',
  '인천',
  '대전',
  '경북',
  '세종',
  '광주',
  '전북',
  '강원',
  '울산',
  '전남',
  '부산',
  '제주',
  '충북',
  '경남',
]; //api로 데이터가 정리가 된다 한들 내부에서 정리가 필요함 , 로우데이터일 경우에는 필수

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkColor,
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(
              '지역선택',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          ...regions
              .map(
                // 이미 '지역선택은 list 값이므로 중복해서 list를 넣을 수 없기 때문에 cast opertate로 지정해야줘야 한다.
                (e) => ListTile(
                  tileColor: Colors.white,
                  selectedTileColor: lightColor,
                  selectedColor: Colors.black,
                  selected: e == '서울',
                  onTap: () {},
                  title: Text(
                    e,
                  ),
                ),
              )
              .toList(),
          //list 뷰에만 넣을 필요없음, tile안에 들어가면 예쁘게 나옴
        ],
      ),
    );
  }
}
