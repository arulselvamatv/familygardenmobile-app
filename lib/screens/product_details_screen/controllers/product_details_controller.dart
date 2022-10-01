import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final CarouselController carouselController = CarouselController();

  RxInt selecteIndex = 0.obs;
  RxInt counter = 0.obs;
  RxBool favourite = false.obs;
  RxBool addToCart = false.obs;

  RxList carouselImage = [
    'assets/images/Carrot 1.png',
    'assets/images/Carrot 1.png',
    'assets/images/Carrot 1.png',
  ].obs;

  RxList productWeight = [
    '250 grams',
    '500 grams',
    '1 KG',
  ].obs;

  onProductWeightSelected(int index){
        selecteIndex.value = index;
        productWeight.refresh();
  }

  onFavouriteButtonSelected(){
    if(favourite.value == false){
      favourite.value = true;
    } else {
      favourite.value = false;
    }
}

onAddToCartSelected(){
    if(addToCart.value == false){
      addToCart.value = true;
    }
}

minus(){
  if (counter.value == 0) {
    return;
  } else {
    counter.value -= 1;
  }
}

add(){
  counter.value += 1;
}
}
