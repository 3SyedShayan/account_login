import 'package:account_login/models/food_item.dart';

List<FoodItem> foodData = [
  // BURGERS
  FoodItem(
    name: "Zinger Burger",
    category: FoodCategory.burger,
    imageUrl: "assets/images/food/burger/1.jpg",
    price: 350,
    description:
        "A delicious zinger burger with crispy chicken. Specially made in oven with a heat of 55 Celsius. Eat it to live it",
    ratings: 4.5,
    duration: 30,
  ),
  FoodItem(
    name: "Cheese Burger",
    category: FoodCategory.burger,
    imageUrl: "assets/images/food/burger/2.jpg",
    price: 400,
    description:
        "A cheesy delight with a perfect blend of flavors. Made with fresh ingredients and love.",
    ratings: 4.7,
    duration: 25,
  ),
  FoodItem(
    name: "BBQ Beef Burger",
    category: FoodCategory.burger,
    imageUrl: "assets/images/food/burger/3.jpg",
    price: 450,
    description:
        "Juicy beef patty with smoky BBQ sauce, crispy onions and fresh lettuce. A taste that will blow your mind.",
    ratings: 4.8,
    duration: 35,
  ),
  FoodItem(
    name: "Chicken Deluxe",
    category: FoodCategory.burger,
    imageUrl: "assets/images/food/burger/4.jpg",
    price: 420,
    description:
        "Premium chicken burger with special herbs and spices. Served with golden fries and signature sauce.",
    ratings: 4.6,
    duration: 28,
  ),

  FoodItem(
    name: "Fresh Orange Juice",
    category: FoodCategory.drink,

    imageUrl: "assets/images/food/drinks/1.jpg",
    price: 180,
    description:
        "Freshly squeezed orange juice packed with vitamin C. Made from the finest oranges to give you natural energy.",
    ratings: 4.3,
    duration: 5,
  ),
  FoodItem(
    name: "Chocolate Milkshake",
    category: FoodCategory.drink,
    imageUrl: "assets/images/food/drinks/2.jpg",
    price: 250,
    description:
        "Rich and creamy chocolate milkshake topped with whipped cream. Perfect treat for chocolate lovers.",
    ratings: 4.9,
    duration: 10,
  ),
  FoodItem(
    name: "Mango Smoothie",
    category: FoodCategory.drink,
    imageUrl: "assets/images/food/drinks/3.jpg",
    price: 220,
    description:
        "Tropical mango smoothie blended with yogurt and honey. A refreshing drink that tastes like paradise.",
    ratings: 4.4,
    duration: 8,
  ),
  FoodItem(
    name: "Cold Coffee",
    category: FoodCategory.drink,
    imageUrl: "assets/images/food/drinks/4.jpg",
    price: 200,
    description:
        "Iced coffee with a perfect balance of sweetness and caffeine. Made with premium coffee beans and fresh milk.",
    ratings: 4.2,
    duration: 12,
  ),

  // PIZZAS
  FoodItem(
    name: "Margherita Pizza",
    category: FoodCategory.pizza,
    imageUrl: "assets/images/food/pizza/1.jpg",
    price: 650,
    description:
        "Classic Italian pizza with fresh mozzarella, tomato sauce and basil. Simple yet incredibly delicious.",
    ratings: 4.6,
    duration: 20,
  ),
  FoodItem(
    name: "Pepperoni Special",
    category: FoodCategory.pizza,
    imageUrl: "assets/images/food/pizza/2.jpg",
    price: 750,
    description:
        "Loaded with spicy pepperoni, extra cheese and secret Italian herbs. A pizza lover's ultimate dream.",
    ratings: 4.8,
    duration: 25,
  ),
  FoodItem(
    name: "BBQ Chicken Pizza",
    category: FoodCategory.pizza,
    imageUrl: "assets/images/food/pizza/3.jpg",
    price: 850,
    description:
        "Tender BBQ chicken with onions, bell peppers and smoky sauce. Cooked to perfection in wood-fired oven.",
    ratings: 4.9,
    duration: 30,
  ),
  FoodItem(
    name: "Veggie Supreme",
    category: FoodCategory.pizza,
    imageUrl: "assets/images/food/pizza/4.jpg",
    price: 700,
    description:
        "Fresh vegetables including mushrooms, olives, peppers and onions. A healthy and tasty vegetarian option.",
    ratings: 4.4,
    duration: 22,
  ),
  FoodItem(
    name: "Chocolate Fudge Cake",
    category: FoodCategory.dessert,
    imageUrl: "assets/images/food/desserts/1.jpg",
    price: 320,
    description:
        "Rich and moist chocolate cake with layers of fudge. Topped with chocolate ganache and served warm.",
    ratings: 4.9,
    duration: 15,
  ),
  FoodItem(
    name: "Strawberry Cheesecake",
    category: FoodCategory.dessert,
    imageUrl: "assets/images/food/desserts/2.jpg",
    price: 380,
    description:
        "Creamy cheesecake with fresh strawberry topping. Made with Philadelphia cream cheese and graham crust.",
    ratings: 4.7,
    duration: 12,
  ),
  FoodItem(
    name: "Vanilla Ice Cream",
    category: FoodCategory.dessert,
    imageUrl: "assets/images/food/desserts/3.jpg",
    price: 150,
    description:
        "Premium vanilla ice cream made with real vanilla beans. Smooth, creamy and absolutely irresistible.",
    ratings: 4.5,
    duration: 5,
  ),
  FoodItem(
    name: "Apple Pie",
    category: FoodCategory.dessert,
    imageUrl: "assets/images/food/desserts/4.jpg",
    price: 280,
    description:
        "Traditional apple pie with cinnamon and sugar. Served with a scoop of vanilla ice cream on the side.",
    ratings: 4.6,
    duration: 18,
  ),
];

// // Category-wise data for easy filtering
// List<FoodItem> getBurgers() => foodData.where((item) => foodData.indexOf(item) < 4).toList();
// List<FoodItem> getDrinks() => foodData.where((item) => foodData.indexOf(item) >= 4 && foodData.indexOf(item) < 8).toList();
// List<FoodItem> getPizzas() => foodData.where((item) => foodData.indexOf(item) >= 8 && foodData.indexOf(item) < 12).toList();
// List<FoodItem> getDesserts() => foodData.where((item) => foodData.indexOf(item) >= 12).toList();

// // Get items by category name
// List<FoodItem> getFoodByCategory(String category) {
//   switch (category.toLowerCase()) {
//     case 'burger':
//     case 'burgers':
//       return getBurgers();
//     case 'drink':
//     case 'drinks':
//       return getDrinks();
//     case 'pizza':
//     case 'pizzas':
//       return getPizzas();
//     case 'dessert':
//     case 'desserts':
//       return getDesserts();
//     default:
//       return foodData;
//   }
// }
