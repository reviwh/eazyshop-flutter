import 'package:eazyshop/core/theme/app_color.dart';
import 'package:eazyshop/core/theme/app_style.dart';
import 'package:eazyshop/data/models/product.dart';
import 'package:eazyshop/utils/extension.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product data;
  final VoidCallback? onTap;
  const ProductCard({
    required this.data,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: SizedBox(
          width: 186,
          height: 250,
          child: Stack(
            children: [
              _buildCard(),
              _buildFavorite(),
            ],
          ),
        ),
      ),
    );
  }

  _buildCard() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 186,
          height: 178,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: DecorationImage(
              image: NetworkImage(data.images[0]),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(4, 4),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          data.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.cardTitle.copyWith(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          data.price.getCurrency(),
          style: AppStyles.cardSubtitle,
        ),
      ],
    );
  }

  _buildFavorite() {
    return Positioned(
      top: 12,
      right: 12,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.grey,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
