class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> productList = [];
  Map<Product, int> cart = {};

  ShoppingMall(this.productList);

  void showProducts() {
    if (productList.isEmpty) {
    } else {
      for (var product in productList) {
        print('${product.name} / ${product.price}원');
      }
    }
  }

  void addToCart(String productName, int quantity) {
    Product? selectedProduct;

    for (var product in productList) {
      if (product.name == productName) {
        selectedProduct = product;
        break;
      }
    }

    if (selectedProduct == null) {
      print("해당 상품은 품절입니다.");
      return;
    }

    if (quantity > 0) {
      cart[selectedProduct] = (cart[selectedProduct] ?? 0) + quantity;
      print('장바구니에 ${selectedProduct.name} $quantity개가 담겼습니다!');
    } else {
      print('0개보다 많은 개수의 상품만 담을 수 있습니다.');
    }
  }

  void showTotal() {
    if (cart.isEmpty) {
      print('장바구니가 비어 있습니다.');
      return;
    }

    int totalPrice = 0;

    cart.forEach((product, quantity) {
      totalPrice += product.price * quantity;
    });

    print('장바구니의 총 가격은 $totalPrice원입니다.');
  }

  void removeFromCart(String productName) {
    Product? selectedProduct;

    for (var product in productList) {
      if (product.name == productName) {
        selectedProduct = product;
        break;
      }
    }

    if (selectedProduct == null || !cart.containsKey(selectedProduct)) {
      return;
    }
  }
}
