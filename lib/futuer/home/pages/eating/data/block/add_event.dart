// ignore_for_file: override_on_non_overriding_member


abstract class FoodEvent {}

class FetchFoodsEvent extends FoodEvent {}
class AddFoodEvent extends FoodEvent {
  final Map<String, dynamic> data;
  AddFoodEvent(this.data);
}
class UpdateFoodEvent extends FoodEvent {
  final int id;
  final Map<String, dynamic> data;
  UpdateFoodEvent(this.id, this.data);
}
class DeleteFoodEvent extends FoodEvent {
  final int id;
  DeleteFoodEvent(this.id);
}