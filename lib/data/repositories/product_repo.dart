import 'package:eazyshop/data/datasource/api/api_service.dart';
import 'package:eazyshop/data/models/product.dart';

class ProductRepository {
  final ApiService _apiService = ApiService();

  Future<List<Product>> get() async => _apiService.getProducts();
  Future<List<Product>> getNew() async => _apiService.getProducts();
  Future<List<Product>> getPopular() async => _apiService.getPopularProducts();
}
