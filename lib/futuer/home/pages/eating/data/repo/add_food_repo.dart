import 'package:chef_ui_app/futuer/home/pages/eating/data/model/add_meal.dart';
import 'package:dio/dio.dart';


class ApiService {
  final Dio _dio = Dio();

  Future<List<AddMeal>> getFoods() async {
    final response = await _dio.get('https://mangamediaa.com/house-food/public/api/chef/foods?page=2');
    if (response.statusCode == 200) {
      final data = response.data['data'] as List;
      return data.map((item) => AddMeal.fromJson(item)).toList();
    } else {
      throw Exception('فشل في تحميل الأكلات');
    }
  }

  Future<void> addFood(Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    await _dio.post('https://mangamediaa.com/house-food/public/api/chef/foods', data: formData);
  }

  Future<void> updateFood(int id, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    await _dio.post('https://mangamediaa.com/house-food/public/api/chef/foods/$id', data: formData);
  }

  Future<void> deleteFood(int id) async {
    await _dio.delete('https://mangamediaa.com/house-food/public/api/chef/foods/$id');
  }
}
