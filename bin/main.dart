import 'dart:io';
import 'package:liyujin/shopping_mall.dart';

void main() {
  List<Product> products = [
    Product('탕후루', 5000),
    Product('요아정', 3000),
    Product('두바이', 4000),
    Product('카스테라', 3800),
    Product('명란바케트', 5000),
  ];

  ShoppingMall myShop = ShoppingMall(products);

  while (true) {
    print(
        '--------------------------------------------------------------------------------------------------------------');
    print(
        '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    print(
        '--------------------------------------------------------------------------------------------------------------');
    print('어떤 기능을 사용하시겠습니까? (1, 2, 3, 4 중 하나를 선택하세요)');
    String? choice = stdin.readLineSync()?.trim();

    if (choice == '1') {
      myShop.showProducts();
    } else if (choice == '2') {
      print('상품 이름을 입력해 주세요!');
      String? productName = stdin.readLineSync()?.trim();

      print(productName);
      if (productName == null || productName.isEmpty) {
        print('유효한 상품 이름을 입력해 주세요.');
        continue;
      }

      bool productExists =
          products.any((product) => product.name == productName);
      if (!productExists) {
        print('해당 상품은 목록에 없습니다. 다시 시도해 주세요.');
        continue;
      }

      print('상품 개수를 입력해 주세요!');
      String? quantityInput = stdin.readLineSync()?.trim();

      if (quantityInput == null || quantityInput.isEmpty) {
        print('유효한 개수를 입력해 주세요.');
        continue;
      }

      int? quantity = int.tryParse(quantityInput);
      if (quantity == null || quantity <= 0) {
        print('유효한 숫자를 입력해 주세요.');
        continue;
      }

      myShop.addToCart(productName, quantity);
    } else if (choice == '3') {
      myShop.showTotal();
    } else if (choice == '4') {
      print('이용해 주셔서 감사합니다 ~ 안녕히 가세요!');
      break;
    } else {
      print('지원하지 않는 기능입니다! 다시 시도해 주세요.');
    }
  }
}
