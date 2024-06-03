import 'package:eazyshop/data/models/category.dart';
import 'package:eazyshop/data/models/product.dart';

class ApiService {
  // final String _baseUrl = "";

  Future<List<Product>> getProducts() async {
    List<Product> dummyProducts = const [
      Product(
        id: 1,
        name: "Product 1",
        price: 100,
        images: ["https://source.unsplash.com/random/200x200/?clothes"],
        description: "This is product 1",
        colors: ["black"],
        category: "Category 1",
        stock: 10,
        rating: 4.5,
        reviews: 10,
        views: 100,
      ),
      Product(
        id: 2,
        name: "Product 2",
        price: 200,
        images: ["https://source.unsplash.com/random/200x200/?clothes"],
        description: "This is product 2",
        colors: ["red"],
        category: "Category 2",
        stock: 20,
        rating: 4.8,
        reviews: 20,
        views: 200,
      ),
      Product(
        id: 3,
        name: "Product 3",
        price: 300,
        images: ["https://source.unsplash.com/random/200x200/?clothes"],
        description: "This is product 3",
        colors: ["green"],
        category: "Category 3",
        stock: 30,
        rating: 4.9,
        reviews: 30,
        views: 300,
      ),
      Product(
        id: 4,
        name: "Product 4",
        price: 400,
        images: ["https://source.unsplash.com/random/200x200/?clothes"],
        description: "This is product 4",
        colors: ["blue"],
        category: "Category 4",
        stock: 40,
        rating: 5,
        reviews: 40,
        views: 400,
      ),
      Product(
        id: 5,
        name: "Product 5",
        price: 500,
        images: ["https://source.unsplash.com/random/200x200/?clothes"],
        description: "This is product 5",
        colors: ["yellow"],
        category: "Category 5",
        stock: 50,
        rating: 4.7,
        reviews: 50,
        views: 500,
      ),
      Product(
        id: 6,
        name: "Product 6",
        price: 600,
        images: ["https://source.unsplash.com/random/200x200/?clothes"],
        description: "This is product 6",
        colors: ["orange"],
        category: "Category 6",
        stock: 60,
        rating: 4.6,
        reviews: 60,
        views: 600,
      ),
    ];

    return dummyProducts;
  }

  Future<List<Product>> getPopularProducts() async {
    List<Product> dummyProducts = const [
      Product(
        id: 1,
        name: "Product 1",
        price: 100,
        images: ["https://source.unsplash.com/random/200x200/?clothes"],
        description: "This is product 1",
        colors: ["black"],
        category: "Category 1",
        stock: 10,
        rating: 4.5,
        reviews: 10,
        views: 100,
      ),
      Product(
        id: 2,
        name: "Product 2",
        price: 200,
        images: ["https://source.unsplash.com/random/200x200/?clothes"],
        description: "This is product 2",
        colors: ["red"],
        category: "Category 2",
        stock: 20,
        rating: 4.8,
        reviews: 20,
        views: 200,
      ),
      Product(
        id: 3,
        name: "Product 3",
        price: 300,
        images: ["https://source.unsplash.com/random/200x200/?clothes"],
        description: "This is product 3",
        colors: ["green"],
        category: "Category 3",
        stock: 30,
        rating: 4.9,
        reviews: 30,
        views: 300,
      ),
      Product(
        id: 4,
        name: "Product 4",
        price: 400,
        images: ["https://source.unsplash.com/random/200x200/?clothes"],
        description: "This is product 4",
        colors: ["blue"],
        category: "Category 4",
        stock: 40,
        rating: 5,
        reviews: 40,
        views: 400,
      ),
    ];

    return dummyProducts;
  }

  Future<List<Category>> getCatgories() async {
    List<Category> dummyCategories = const [
      Category(
        name: "Category 1",
        image: "https://source.unsplash.com/random/300x300/?clothes",
        products: 123,
      ),
      Category(
        name: "Category 2",
        image: "https://source.unsplash.com/random/300x300/?clothes",
        products: 413,
      ),
      Category(
        name: "Category 3",
        image: "https://source.unsplash.com/random/300x300/?clothes",
        products: 435,
      ),
      Category(
        name: "Category 4",
        image: "https://source.unsplash.com/random/300x300/?clothes",
        products: 351,
      ),
      Category(
        name: "Category 5",
        image: "https://source.unsplash.com/random/300x300/?clothes",
        products: 324,
      ),
      Category(
        name: "Category 6",
        image: "https://source.unsplash.com/random/300x300/?clothes",
        products: 762,
      ),
    ];

    return dummyCategories;
  }
}
