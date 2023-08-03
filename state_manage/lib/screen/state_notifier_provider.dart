import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_manage/layout/default_layout.dart';

class StateNotifierProvider extends ConsumerWidget {
  const StateNotifierProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);


    return DefaultLayout(
        title: 'StateNotifierProvider',
        body: ListView(
          children: [],
        ));
  }
}
