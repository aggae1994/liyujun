import 'package:test/test.dart';
import 'package:liyujin/shopping_mall.dart';

void main() {
  test('상품 목록이 제대로 표시되는지 테스트', () {
    var products = [
      Product('탕후루', 5000),
      Product('요아정', 3000),
    ];
    var mall = ShoppingMall(products);

    expect(mall.productList.length, equals(2));
    expect(mall.productList[0].name, equals('탕후루'));
    expect(mall.productList[1].name, equals('요아정'));
  });

  test('장바구니에 상품을 추가하는 테스트', () {
    var products = [
      Product('탕후루', 5000),
      Product('요아정', 3000),
    ];
    var mall = ShoppingMall(products);

    mall.addToCart('탕후루', 2);
    expect(mall.cart.length, equals(1));
    expect(mall.cart.containsKey(products[0]), isTrue);
    expect(mall.cart[products[0]], equals(2));

    mall.addToCart('요아정', 1);
    expect(mall.cart.length, equals(2));
    expect(mall.cart.containsKey(products[1]), isTrue);
    expect(mall.cart[products[1]], equals(1));
  });

  test('장바구니의 총 가격을 계산하는 테스트', () {
    var products = [
      Product('탕후루', 5000),
      Product('요아정', 3000),
    ];
    var mall = ShoppingMall(products);

    mall.addToCart('탕후루', 2); // 총 10000원
    mall.addToCart('요아정', 1); // 총 3000원
    int totalPrice = mall.cart.entries
        .fold(0, (sum, entry) => sum + (entry.key.price * entry.value));

    expect(totalPrice, equals(13000)); // 총액은 13000원이어야 함
  });
}
