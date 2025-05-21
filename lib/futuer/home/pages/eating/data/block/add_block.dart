import 'package:chef_ui_app/futuer/home/pages/eating/data/block/add_event.dart';
import 'package:chef_ui_app/futuer/home/pages/eating/data/block/add_state.dart';
import 'package:chef_ui_app/futuer/home/pages/eating/data/repo/add_food_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final ApiService apiService;
  FoodBloc(this.apiService) : super(FoodInitial()) {
    on<FetchFoodsEvent>((event, emit) async {
      emit(FoodLoading());
      try {
        final foods = await apiService.getFoods();
        emit(FoodLoaded(foods));
      } catch (e) {
        emit(FoodError(e.toString()));
      }
    });

    on<AddFoodEvent>((event, emit) async {
      try {
        await apiService.addFood(event.data);
        add(FetchFoodsEvent());
      } catch (e) {
        emit(FoodError(e.toString()));
      }
    });

    on<UpdateFoodEvent>((event, emit) async {
      try {
        await apiService.updateFood(event.id, event.data);
        add(FetchFoodsEvent());
      } catch (e) {
        emit(FoodError(e.toString()));
      }
    });

    on<DeleteFoodEvent>((event, emit) async {
      try {
        await apiService.deleteFood(event.id);
        add(FetchFoodsEvent());
      } catch (e) {
        emit(FoodError(e.toString()));
      }
    });
  }
}