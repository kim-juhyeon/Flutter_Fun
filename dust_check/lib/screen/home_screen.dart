import 'package:dust_check/component/card_title.dart';
import 'package:dust_check/component/category_card.dart';
import 'package:dust_check/component/hourl_card.dart';
import 'package:dust_check/component/main_app_bar.dart';
import 'package:dust_check/component/main_card.dart';
import 'package:dust_check/component/main_drawer.dart';
import 'package:dust_check/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
