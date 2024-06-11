class FoodModel {
  String imageFood;
  String foodName;
  String priceFood;
  FoodModel(this.imageFood, this.foodName, this.priceFood);

  Map<String, dynamic> toJson() {
    return {
      'imageFood': imageFood,
      // 'password': password,
      'foodName': foodName,
      'priceFood': priceFood,
    };
  }

  static List<FoodModel> menu = [
    FoodModel('assets/images/food/img_food.jpg', 'Hamburgur Super', '20\$'),
    FoodModel('assets/images/food/img_food.jpg', 'Bánh Xe', '20\$'),
    FoodModel('assets/images/food/img_food2.jpg', 'Noodles Yummy', '15\$'),
    FoodModel('assets/images/food/img_food3.jpg', 'Rice Chiên', '25\$'),
    FoodModel('assets/images/food/img_food4.jpg', 'Vegetable Salad', '40\$'),
    FoodModel('assets/images/food/img_food5.jpg', 'Pizza Luxury', '35\$'),
    FoodModel('assets/images/food/img_food6.jpg', 'Salad Healthy', '200\$'),
    FoodModel('assets/images/food/img_food7.jpg', 'Pancake Sweet', '8\$'),
    FoodModel('assets/images/food/img_food8.jpg', 'Cake Noodles', '15\$'),
    FoodModel('assets/images/food/img_food9.jpg', 'Beef Steak', '20\$'),
    FoodModel('assets/images/food/img_food10.jpg', 'Cheese Chicken', '20\$'),
    FoodModel('assets/images/food/img_food11.jpg', 'Rice Chicken', '20\$'),
  ];
}
