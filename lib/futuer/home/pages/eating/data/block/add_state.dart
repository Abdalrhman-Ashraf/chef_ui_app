

import 'package:chef_ui_app/futuer/home/pages/eating/data/model/add_meal.dart';

abstract class FoodState {}

class FoodInitial extends FoodState {}
class FoodLoading extends FoodState {}
class FoodLoaded extends FoodState {
  final List<AddMeal> foods;
  FoodLoaded(this.foods);

  get foodList => null;
}
class FoodError extends FoodState {
  final String error;
  FoodError(this.error);
}
class FoodSuccess extends FoodState {}