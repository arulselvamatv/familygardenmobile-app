import '../../../utils/common_import/common_import.dart';

class CategoriesController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxList categoryList = [
    {
      'name': 'All Fruits & Vegetables',
      'image': 'assets/images/allFruits&Vegetables.png'
    },
    {'name': 'Fresh Vegetables', 'image': 'assets/images/freshVegetables.png'},
    {
      'name': 'Herbs & Seasonlings',
      'image': 'assets/images/herbs&Seasonlings.png'
    },
    {'name': 'Fresh Fruits', 'image': 'assets/images/freshFruits.png'},
    {
      'name': 'Organic Fruits & Vegetables',
      'image': 'assets/images/organicFruits.png'
    },
    {'name': 'Fresh-Cut Packaging', 'image': 'assets/images/freshCut.png'},
  ].obs;
}
