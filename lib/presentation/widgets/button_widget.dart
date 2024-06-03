import 'package:eazyshop/core/theme/app_color.dart';
import 'package:eazyshop/core/theme/app_style.dart';
import 'package:eazyshop/presentation/widgets/loader.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isLoading;
  const ButtonWidget({
    required this.text,
    this.onTap,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isLoading
                ? AppColors.primary.withOpacity(.5)
                : AppColors.primary,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 4,
                offset: const Offset(5, 8),
              ),
            ],
          ),
          child: isLoading
              ? const Loader(color: Colors.white)
              : Center(
                  child: Text(
                    text,
                    style: AppStyles.button,
                  ),
                ),
        ),
      ),
    );
  }
}
