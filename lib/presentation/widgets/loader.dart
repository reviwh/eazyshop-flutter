import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Color? color;
  const Loader({this.color, super.key});

  @override
  Widget build(BuildContext context) =>
      Center(child: CircularProgressIndicator(color: color));
}
