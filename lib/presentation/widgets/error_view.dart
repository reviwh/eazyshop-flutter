import 'package:eazyshop/core/theme/app_style.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String message;
  const ErrorView({required this.message, super.key});

  @override
  Widget build(BuildContext context) =>
      Center(child: Text(message, style: AppStyles.header));
}
