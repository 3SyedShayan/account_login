enum FoodCategory { pizza, burger, dessert, drink }

class FoodItem {
  final String name;
  final FoodCategory category;
  final String imageUrl;
  final double price;
  final String description;
  final double ratings;
  final int duration;

  FoodItem({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.ratings,
    required this.duration,
  });
}
