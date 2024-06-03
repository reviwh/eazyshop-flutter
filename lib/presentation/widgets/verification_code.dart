import 'package:eazyshop/core/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationCode extends StatelessWidget {
  final List<TextEditingController> controllers;

  const VerificationCode({
    required this.controllers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < controllers.length; i++) {
      bool isLast = i == controllers.length - 1;
      children.add(_textField(controllers[i], isLast: isLast));
      if (!isLast) {
        children.add(const SizedBox(width: 16));
      }
    }

    return Row(
      children: children,
    );
  }

  Widget _textField(
    TextEditingController controller, {
    bool isLast = false,
  }) {
    return Expanded(
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        style: AppStyles.display,
        keyboardType: TextInputType.number,
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
