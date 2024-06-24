import 'package:flutter/material.dart';
import 'package:reservebite/widget/font_support.dart';

class FoodData {
  static List<Food> southIndianDishes = [
    Food('Idli', 99, 'Steamed rice cake'),
    Food('Dosa', 149, 'Fermented rice and lentil crepe'),
    Food('Vada', 129, 'Fried lentil doughnut'),
  ];

  static List<Food> italianDishes = [
    Food('Pasta', 199, 'Classic Italian pasta dish'),
    Food('Pizza', 299, 'Freshly baked pizza with mozzarella cheese'),
    Food('Risotto', 399, 'Creamy risotto with parmesan cheese'),
  ];

  static List<Food> northIndianDishes = [
    Food('Tandoori Chicken', 699, 'Marinated chicken cooked in a clay oven'),
    Food('Palak Paneer', 599, 'Creamy spinach curry with paneer cheese'),
    Food('Naan Bread', 199, 'Freshly baked Indian flatbread'),
  ];

  static List<Food> panAsiaDishes = [
    Food('Sushi', 499, 'Japanese-style vinegared rice and raw fish'),
    Food('Pad Thai', 399, 'Stir-fried rice noodles with shrimp and vegetables'),
    Food('Kung Pao Chicken', 499, 'Spicy Sichuan-style chicken dish'),
  ];

  static List<Food> multiCuisineDishes = [
    Food('Chicken Tikka Masala', 349,
        'Marinated chicken in a creamy tomato sauce'),
    Food('Palak Paneer Wrap', 299,
        'Spinach and paneer cheese wrap with mint chutney'),
    Food('Veg Biryani', 249, 'Mixed vegetable and basmati rice dish'),
    Food('Samosas', 199,
        'Crispy fried or baked pastries with spiced potatoes and peas'),
    Food('Gulab Jamun', 149, 'Deep-fried dumplings in a sweet rose syrup'),
  ];

  static List<Food> chineseDishes = [
    Food('Kung Pao Chicken', 499, 'Spicy Sichuan-style chicken dish'),
    Food('Beef and Broccoli', 399,
        'Stir-fried beef and broccoli in oyster sauce'),
    Food('Wonton Soup', 199, 'Delicious wontons in a savory broth'),
  ];

  static List<Food> breakfastDishes = [
    Food('Eggs Benedict', 249, 'Poached eggs on toasted English muffins'),
    Food('Pancakes', 199, 'Fluffy buttermilk pancakes with maple syrup'),
    Food('Omelette', 149, 'Whisked eggs with vegetables and cheese'),
  ];

  static List<Food> lunchDishes = [
    Food('Grilled Chicken Sandwich', 299,
        'Marinated chicken breast on toasted bread'),
    Food('Veggie Burger', 249,
        'Veggie patty on a toasted bun with lettuce and tomato'),
    Food(
        'Chicken Quesadilla', 199, 'Shredded chicken and cheese in a tortilla'),
  ];

  static List<Food> dinnerDishes = [
    Food('Steak Frites', 499, 'Grilled steak with crispy fries'),
    Food('Roasted Chicken', 399, 'Herbed chicken roasted to perfection'),
    Food('Seafood Paella', 599,
        'Saffron-infused rice with shrimp, mussels, and clams'),
  ];

  static List<Food> fastFoodDishes = [
    Food('Burger', 199, 'Juicy beef patty with lettuce and tomato'),
    Food('Fries', 149, 'Crispy fried potatoes'),
    Food('Chicken Nuggets', 199, 'Breaded and fried chicken pieces'),
  ];
}

class Food {
  String name;
  double price;
  String description;

  Food(this.name, this.price, this.description);
}

class Menu extends StatefulWidget {
  final List<Food> foodItems;
  const Menu({super.key, required this.foodItems});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Menu'),
      ),
      body: ListView.builder(
        itemCount: widget.foodItems.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                widget.foodItems[index].name,
                style: AppWidget.boldTextFeildStyle(),
              ),
              subtitle: Text(
                widget.foodItems[index].description,
                style: AppWidget.lightTextFeildStyle(),
              ),
              trailing: Text(
                '₹${widget.foodItems[index].price}',
                style: AppWidget.semiBoldTextFeildStyle(),
              ),
            ),
          );
        },
      ),
    );
  }
}
