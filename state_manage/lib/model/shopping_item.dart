class ShoppingItemModel {
  final String name;
  final int quantity;
  //구매했는지
  final bool hasBought;
  //매운지
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });
}
