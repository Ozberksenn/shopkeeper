import 'package:get/get.dart';

import '../model/product_model.dart';

class OrderController extends GetxController {
  RxSet<ProductModel> choosenId = <ProductModel>{}.obs;
  RxInt sumPrice = 0.obs;
  RxBool basketController = false.obs;
  RxString orderDescription = "".obs;
  // List<ProductModel> productList = [
  //   ProductModel(
  //     quantity: 0.obs,
  //     productId: 0,
  //     productImage:
  //         'https://flo.health/uploads/media/sulu-1200x630/05/1905-Two%20glasses%20of%20beer.jpg?v=1-0&inline=1',
  //     productCategory: 'Drinks',
  //     productName: 'Beer',
  //     productDescription: 'Ürün bilgisi Bira',
  //     productPrice: 5,
  //   ),
  //   ProductModel(
  //       quantity: 0.obs,
  //       productId: 1,
  //       productImage:
  //           'https://cdn.yemek.com/mnresize/1250/833/uploads/2016/03/firinda-baharatli-patates-yemekcom.jpg',
  //       productCategory: 'Have Lunch',
  //       productName: 'Patates Kızartması',
  //       productDescription: 'Ürün bilgisi patates kızartması',
  //       productPrice: 45),
  //   ProductModel(
  //       quantity: 0.obs,
  //       productId: 2,
  //       productImage:
  //           'https://i4.hurimg.com/i/hurriyet/75/750x422/5b8d24037152d81ed47686fb.jpg',
  //       productCategory: 'Breakfast',
  //       productName: 'Omelette',
  //       productDescription: 'Ürün bilgisi Omlet',
  //       productPrice: 25),
  //   ProductModel(
  //     quantity: 0.obs,
  //     productId: 4,
  //     productImage:
  //         'https://www.burgerking.com.tr/cmsfiles/products/hamburger-menu.png?v=256',
  //     productCategory: 'Have Lunch',
  //     productName: 'hamburger',
  //     productDescription: 'Ürün bilgisi Hamburger',
  //     productPrice: 12,
  //   ),
  //   ProductModel(
  //       quantity: 0.obs,
  //       productId: 5,
  //       productImage:
  //           'https://st3.myideasoft.com/idea/et/28/myassets/products/141/cemens-sirt-pastirma.jpg?revision=1683551728',
  //       productCategory: 'Breakfast',
  //       productName: 'Pastırma',
  //       productDescription: 'Ürün bilgisi Pastırma',
  //       productPrice: 15),
  //   ProductModel(
  //       quantity: 0.obs,
  //       productId: 6,
  //       productImage:
  //           'https://cdn.dsmcdn.com/ty330/product/media/images/20220215/14/50659178/115874973/1/1_org_zoom.jpg',
  //       productCategory: 'Drinks',
  //       productName: 'Su',
  //       productDescription: 'Ürün bilgisi Su',
  //       productPrice: 1),
  //   ProductModel(
  //       quantity: 0.obs,
  //       productId: 7,
  //       productImage:
  //           'https://www.ardaninmutfagi.com/wp-content/uploads/2019/05/Limonata-3-d.jpg',
  //       productCategory: 'Drinks',
  //       productName: 'Limonata',
  //       productDescription: 'Ürün bilgisi Limonata',
  //       productPrice: 3),
  //   ProductModel(
  //       quantity: 0.obs,
  //       productId: 7,
  //       productImage:
  //           'https://im.haberturk.com/yerel_haber/2020/11/30/ver1606713128/82747192_620x410.jpg',
  //       productCategory: 'Have Lunch',
  //       productName: 'Balık',
  //       productDescription: 'Ürün bilgisi Balık',
  //       productPrice: 30),
  // ];

  void addId(ProductModel pModel) {
    choosenId.add(pModel);
  }

  void removeId(ProductModel pModel) {
    choosenId.remove(pModel);
  }

  void sumBasket() {
    int sum = 0;
    for (var element in choosenId) {
      int totalPrice = element.quantity.value * element.productPrice!;
      sum += totalPrice;
    }
    sumPrice.value = sum;
  }
}
