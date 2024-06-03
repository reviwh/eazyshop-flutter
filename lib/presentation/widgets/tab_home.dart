import 'package:carousel_slider/carousel_slider.dart';
import 'package:eazyshop/core/theme/app_color.dart';
import 'package:eazyshop/core/theme/app_style.dart';
import 'package:eazyshop/data/models/category.dart';
import 'package:eazyshop/data/models/product.dart';
import 'package:eazyshop/data/repositories/category_repo.dart';
import 'package:eazyshop/data/repositories/product_repo.dart';
import 'package:eazyshop/presentation/widgets/product_card.dart';
import 'package:eazyshop/presentation/widgets/carousel_item.dart';
import 'package:flutter/material.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  final ProductRepository _productRepository = ProductRepository();
  final CategoryRepository _categoryRepository = CategoryRepository();
  int _currentIndex = 0;

  final List<Product> _newItems = [];
  final List<Category> _categories = [];

  final List<Widget> _carouselItem = const [
    CarouselItem(image: "https://source.unsplash.com/random/300x100/?sale"),
    CarouselItem(image: "https://source.unsplash.com/random/300x100/?sale"),
    CarouselItem(image: "https://source.unsplash.com/random/300x100/?sale"),
  ];

  getNewItems() async {
    _newItems.clear();
    var items = await _productRepository.get();
    setState(() {
      _newItems.addAll(items);
    });
  }

  getCategories() async {
    _categories.clear();
    var items = await _categoryRepository.get();
    setState(() {
      _categories.addAll(items);
    });
  }

  @override
  void initState() {
    super.initState();
    getNewItems();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    "https://source.unsplash.com/random/?face",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, John Doe",
                          style: AppStyles.infoTitle,
                        ),
                        Text(
                          "Come on, go shopping and look for the items you want",
                          style: AppStyles.infoBody,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_outlined,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _tab(
                label: 'Home',
                active: _currentIndex == 0,
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              _tab(
                label: 'Category',
                active: _currentIndex == 1,
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (_currentIndex == 0) _buildHome(),
          if (_currentIndex == 1)
            for (int i = 0; i < _categories.length; i++)
              _buildCategory(_categories[i]),
        ],
      ),
    );
  }

  _tab({
    required String label,
    bool active = false,
    required VoidCallback onTap,
  }) {
    Color foregroundColor =
        active ? Colors.white : Colors.black.withOpacity(.5);
    Color backgroundColor = active ? AppColors.tertiary : Colors.white;

    return Expanded(
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                label,
                style: AppStyles.span.copyWith(color: foregroundColor),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildHome() {
    int sumItems = (_newItems.length / 2.0).ceil();
    double newItemHeight = 250.0 * sumItems + 16.0 * (sumItems - 1);
    return SizedBox(
      height: 156 + 64 + newItemHeight,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          CarouselSlider(
            items: _carouselItem,
            options: CarouselOptions(
              height: 156,
              autoPlay: true,
              enlargeCenterPage: false,
              enableInfiniteScroll: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Items",
                  style: AppStyles.span.copyWith(color: Colors.black),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View All",
                    style: AppStyles.infoTitle.copyWith(color: AppColors.link),
                  ),
                ),
              ],
            ),
          ),
          _buildNewItems(),
        ],
      ),
    );
  }

  _buildNewItems() {
    List<Widget> items = [];
    for (var i = 0; i < _newItems.length; i += 2) {
      if (i != _newItems.length - 1) {
        items.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductCard(
              data: _newItems[i],
              onTap: () {},
            ),
            ProductCard(
              data: _newItems[i + 1],
              onTap: () {},
            ),
          ],
        ));
        items.add(const SizedBox(height: 16));
      } else {
        items.add(ProductCard(
          data: _newItems[i],
          onTap: () {},
        ));
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
      ),
      child: SizedBox(
        height: 250.0 * items.length,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: items,
        ),
      ),
    );
  }

  _buildCategory(Category category) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              category.image,
              width: size.width - 64,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              left: 24,
              bottom: 12,
              child: Column(
                children: [
                  Text(
                    category.name,
                    style: AppStyles.span.copyWith(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: const Offset(4, 4),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${category.products} products",
                    style: AppStyles.infoTitle.copyWith(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: const Offset(4, 4),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
