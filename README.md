-완성 범위

1. 상품목록 출력

 2. 장바구니 널값 입력 및 출력
 
 3. 상품을 장바구니에 넣기
 
 4. 장바구니 품목 통합 계산
 
 5. 쇼핑몰 종료


-에러 부분


   장바구니에 물건 및 물건개수를 입력하면 입력한 값이 아닌 널값이 입력된다.


-해결방법


1. 원도우 10 설정중 UTF-8 체크

2. 원도우 터미널을 다운로드 받아 설치하고 vs코드로 작성된 파일을 실행 시키자 문자열과 정수가 널값으로 반환 되는 오류를 해결 하였습니다.

 

-어려웠던 점


강의를 통해 이해하는 것과 혼자 코드를 작성해 보는 것은 큰 차이가 있었습니다. 

특히 현재 제가 격는 문제를 저 혼자 해결 할수있을까? 라는 생각이 들때 가장 힘들었습니다.

웹 서핑을 해서 문제 해결 하는 것은 쉬웠지만 언제까지 웹서핑이나 다른 팀원들에게 의지만 할수 없기에 앞으로 어떻게 해야 하나 생각이 듭니다.




-----------------------------------------------------------------------------------------------------------------------------------------

코드 설명 : mian.dart 

import 'dart:io'; <- 제가 입력한 숫자 및 문자열 을 입력 받기 위해 사용 합니다.

import 'package:liyujin/shopping_mall.dart'; <- 클래스 를 불러들이기 위해 사용 합니다.

void main() {
  List<Product> products = [ <- 제가 정의한 product의 리스트 안에 품명과 가격을 초기화 합니다.
  
    Product('탕후루', 5000),
    Product('요아정', 3000),
    Product('두바이', 4000),
    Product('카스테라', 3800),
    Product('명란바케트', 5000),
  ];

  ShoppingMall myShop = ShoppingMall(products);

  while (true) { <- 메뉴를 선택하기 전이나 선택 한후 지속적으로 메뉴를 화면에 출력해야 하기 때문에 계속 반복되는 와일문을 사용 했습니다.
  
    print(
        '--------------------------------------------------------------------------------------------------------------');
    
    print(
        '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');  <-  메뉴 출력 화면
        
    print(
        '--------------------------------------------------------------------------------------------------------------'); 
        상 하단에 
        "-" 는 사용자가 화면 선택시 칸을 명확하게 볼수있게 만들기 위해 사용했습니다.     
        
    print('어떤 기능을 사용하시겠습니까? (1, 2, 3, 4 중 하나를 선택하세요)');
    
    String? choice = stdin.readLineSync()?.trim(); 
    <- 입력한 숫자와 문자열이 널값으로 입력되어 이 오류를 제거 하기 위해 사용했지만 해결 되지 않았습니다. 
    그냥 터미널 다운 받았더니 해결 됬어요  
    

    if (choice == '1') {

    choice 변수를 사용한 이유는 위에서 말한 숫자,문자열이 제가 입력한 값이 아닌 널 값으로 인식되서 그걸 해결하려고 넣었습니다.
    
      myShop.showProducts();
      
      1 입력시showProducts() 메서드를 호출하여 상품 목록 출력
      
    } else if (choice == '2') {
      print('상품 이름을 입력해 주세요!');
      String? productName = stdin.readLineSync()?.trim(); 

 2 입력시 상품명 을 입력 할수있는 메뉴를 출력하고  입력할수 있게 만들었습니다.
 
      print(productName);
      if (productName == null || productName.isEmpty) {
        print('유효한 상품 이름을 입력해 주세요.');
        continue;
      }
빈 값 그러니까 널값을 입력했을데 나오는 메세지 입니다.
      다시 메뉴 선택 화면이 출력 됩니다.
      
      bool productExists =
          products.any((product) => product.name == productName);
      if (!productExists) {
        print('해당 상품은 목록에 없습니다. 다시 시도해 주세요.');
        continue;
      }
      
불과 productExists를 사용하여 리스트에 상품이 있는지 참,거짓으로 판단하고 없으면 하단에 메시지를 출력합니다.


      print('상품 개수를 입력해 주세요!');
      String? quantityInput = stdin.readLineSync()?.trim();

선택한 품목의 갯수를 입력 합니다.
    
      if (quantityInput == null || quantityInput.isEmpty) {
        print('유효한 개수를 입력해 주세요.');
        continue;
      }

      
      int? quantity = int.tryParse(quantityInput);
      if (quantity == null || quantity <= 0) {
        print('유효한 숫자를 입력해 주세요.');
        continue;
      }


      myShop.addToCart(productName, quantity); <-선택한 품목과 갯수를 장바구니에 추가 합니다.

      
    } else if (choice == '3') {
    
      myShop.showTotal(); <- 3입력시 showTotal() 메서드 호출해서  장바구니 상품의 총 가격을 출력합니다.
      
    } else if (choice == '4') {
      print('이용해 주셔서 감사합니다 ~ 안녕히 가세요!');
      
      break;  <- 4를 입력하면 브레이크 문으로 와일 반목분을 종료 합니다.
      
    } else {
      print('지원하지 않는 기능입니다! 다시 시도해 주세요.'); <- 쇼핑몰 메뉴 항목에 없는 숫자를 입력 할 시 나오는 경고문 입니다.
    }
  }
}
