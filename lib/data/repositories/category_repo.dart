import 'package:eazyshop/data/datasource/api/api_service.dart';
import 'package:eazyshop/data/models/category.dart';

class CategoryRepository {
  final ApiService _apiService = ApiService();

  Future<List<Category>> get() async => _apiService.getCatgories();
}