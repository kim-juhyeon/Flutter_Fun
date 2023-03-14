import 'package:dio/dio.dart';
import 'package:dust_check/component/category_card.dart';
import 'package:dust_check/component/hourl_card.dart';
import 'package:dust_check/component/main_app_bar.dart';
import 'package:dust_check/component/main_drawer.dart';
import 'package:dust_check/const/colors.dart';
import 'package:dust_check/const/data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    final response = await Dio().get(
      'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
      queryParameters: {
        'serviceKey': serviceKey,
        'returnType': 'json',
        'numOfRows ': 30,
        'pageNo': 1,
        'itemCode': 'PM10',
        'dataGubun': 'Hour',
        'searchCondition': 'WEEK'
      },
    );
    print(response.data['response']['body']['itmes']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: const MainDrawer(),
      body: CustomScrollView(
        slivers: [
          const MainAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                CategoryCard(),
                SizedBox(height: 16.0),
                HourlCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
