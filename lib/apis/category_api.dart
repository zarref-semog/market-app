import '../models/category.dart';

class CategoryApi {
  static Future<List<Category>> getCategories() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Category('Meats\n & Cold Cuts',
          'https://img.freepik.com/premium-photo/variety-frozen-meat-food-storage_875825-22858.jpg'),
      Category('Cereals',
          'https://img.freepik.com/premium-photo/assortment-cereals-displayed-grocery-store-shelf_1079150-289076.jpg'),
      Category('Grains',
          'https://img.freepik.com/premium-psd/variety-nuts-snacks-displayed-clear-containers-shelf-grocery-store_1031128-16816.jpg'),
      Category('Pasta',
          'https://img.freepik.com/premium-photo/colorful-display-glutenfree-pasta-varieties-grocery-store-aisle-emphasizing-wide_220770-83589.jpg'),
      Category('Canned',
          'https://img.freepik.com/premium-photo/store-filled-with-neatly-stacked-shelves-displaying-variety-canned-goods-rows-neatly-stacked-shelves-displaying-variety-canned-goods_538213-107762.jpg'),
      Category('Spices',
          'https://img.freepik.com/free-photo/still-life-with-various-spices_23-2149444662.jpg'),
      Category('Dairy',
          'https://img.freepik.com/premium-photo/dairy-section-shelves-stocked-with-milk-yogurt-cheese_1198884-54948.jpg'),
      Category('Fruits',
          'https://img.freepik.com/premium-photo/fresh-fruits-vegetables-supermarket-shelves_464863-3706.jpg'),
      Category('Vegetables',
          'https://img.freepik.com/premium-photo/frozen-food-refrigerator-vegetables-freezer-shelves_641503-170245.jpg'),
      Category('Cleaning',
          'https://img.freepik.com/premium-psd/organized-cleaning-supplies-shelves_713655-35660.jpg'),
      Category('Drinks',
          'https://img.freepik.com/free-photo/abundance-wine-bottles-retail-store-generated-by-ai_188544-42298.jpg?semt=ais_hybrid'),
    ];
  }
}
