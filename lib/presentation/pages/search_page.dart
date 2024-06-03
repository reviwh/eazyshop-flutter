import 'package:eazyshop/core/theme/app_style.dart';
import 'package:eazyshop/data/models/product.dart';
import 'package:eazyshop/data/repositories/product_repo.dart';
import 'package:eazyshop/data/repositories/search_repo.dart';
import 'package:eazyshop/utils/extension.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchRepository _searchRepository = SearchRepository();
  final ProductRepository _productRepository = ProductRepository();
  final TextEditingController _searchController = TextEditingController();

  final List<String> _searchHistory = [];
  final List<Product> _products = [];

  getPopularProducts() async {
    var items = await _productRepository.getPopular();
    setState(() {
      _products.clear();
      _products.addAll(items);
    });
  }

  getSearchHistory() async {
    var items = await _searchRepository.get();
    setState(() {
      _searchHistory.clear();
      _searchHistory.addAll(items);
    });
  }

  addSearchHistory(String value) async {
    await _searchRepository.add(value);
    await getSearchHistory();
  }

  removeSearchHistory(String value) async {
    await _searchRepository.remove(value);
    await getSearchHistory();
  }

  clearSearchHistory() async {
    await _searchRepository.clear();
    await getSearchHistory();
  }

  @override
  void initState() {
    super.initState();
    getPopularProducts();
    getSearchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _topBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        children: [
          if (_searchHistory.isNotEmpty)
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Last Search",
                    style: AppStyles.span.copyWith(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    clearSearchHistory();
                  },
                  child: const Text("Clear All"),
                )
              ],
            ),
          if (_searchHistory.isNotEmpty) const SizedBox(height: 16),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            alignment: WrapAlignment.spaceBetween,
            children: _searchHistory.map((e) {
              return Chip(
                label: Text(
                  e,
                  style: AppStyles.span
                      .copyWith(color: Colors.black.withOpacity(.5)),
                ),
                labelPadding: const EdgeInsets.all(4),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(.5),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                deleteIcon: Icon(
                  Icons.close,
                  color: Colors.black.withOpacity(.5),
                ),
                onDeleted: () {
                  removeSearchHistory(e);
                },
              );
            }).toList(),
          ),
          if (_searchHistory.isNotEmpty) const SizedBox(height: 32),
          Text(
            "Popular Search",
            style: AppStyles.span.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 16),
          for (var item in _products) _productCard(item),
        ],
      ),
    );
  }

  PreferredSizeWidget _topBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.tune),
                  ),
                  hintText: 'Search',
                  hintStyle: AppStyles.infoTitle.copyWith(
                    color: Colors.black.withOpacity(.5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSubmitted: (value) {
                  addSearchHistory(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productCard(Product product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.images[0],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    style: AppStyles.infoTitle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${product.views.getCompact()} Search today",
                    style: AppStyles.infoBody.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFE1FFF1),
            ),
            child: Text(
              "Popular",
              style: AppStyles.infoTitle.copyWith(
                color: const Color(0xFF00D362),
              ),
            ),
          )
        ],
      ),
    );
  }
}
