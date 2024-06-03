import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String assetName;
  final double? size;
  final Color? color;

  const SvgIcon({
    super.key,
    required this.assetName,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Colors.white;
    return SvgPicture.asset(
      assetName,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      fit: BoxFit.contain,
    );
  }
}
