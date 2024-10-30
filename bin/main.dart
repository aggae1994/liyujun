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
    String? choice = stdin.readLineSync()?.trim(); // 입력값에서 불필요한 공백 제거

    if (choice == '1') {
      myShop.showProducts();
    } else if (choice == '2') {
      print('상품 이름을 입력해 주세요!');
      String? productName = stdin.readLineSync()?.trim(); // 공백 제거

      // 상품 이름이 null이거나 빈 문자열인지 확인
      if (productName == null || productName.isEmpty) {
        print('유효한 상품 이름을 입력해 주세요.');
        continue;
      }

      // 상품이 목록에 있는지 확인
      bool productExists =
          products.any((product) => product.name == productName);
      if (!productExists) {
        print('해당 상품은 목록에 없습니다. 다시 시도해 주세요.');
        continue;
      }

      print('상품 개수를 입력해 주세요!');
      String? quantityInput = stdin.readLineSync()?.trim(); // 공백 제거

      // null이 아닌지 확인 후 숫자 변환 시도
      if (quantityInput == null || quantityInput.isEmpty) {
        print('유효한 개수를 입력해 주세요.');
        continue;
      }

      // 숫자 변환을 시도하고 null 여부 확인
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
