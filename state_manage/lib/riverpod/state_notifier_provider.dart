import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_manage/model/shopping_item.dart';

final ShoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);

//StateNotifier의 경우에는 쇼핑항목 여러개들을 관리한다는 의미
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  //생성자를 설정해줘야 함
  ShoppingListNotifier()
      //super은 초기화하는 값이 들어간다.
      : super(
          [
            ShoppingItemModel(
                name: '김치', quantity: 3, hasBought: false, isSpicy: true),
            ShoppingItemModel(
                name: '라면', quantity: 5, hasBought: false, isSpicy: true),
            ShoppingItemModel(
              name: '삼겹살',
              quantity: 10,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '수박',
              quantity: 2,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
                name: '카스테라', quantity: 5, hasBought: false, isSpicy: false)
          ],
        );
  void toggleHasBought({required String name}) {
    state = state
        // 맵핑하면서 이름이 인풋 받은 이름과 같으면 toggle , 아니면 그대로 e 값이 된다. -> 맵하면 새로운 리스트값이 생성됨
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy,
              )
            : e)
        .toList();
  }
}
