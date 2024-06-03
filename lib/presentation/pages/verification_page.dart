import 'dart:async';

import 'package:eazyshop/core/theme/app_color.dart';
import 'package:eazyshop/core/theme/app_style.dart';
import 'package:eazyshop/presentation/widgets/button_widget.dart';
import 'package:eazyshop/presentation/widgets/svg_icon.dart';
import 'package:eazyshop/presentation/widgets/verification_code.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();

  String _resendText = "Resend";

  bool _isLoading = false;

  void _resend() {
    if (_resendText != "Resend") {
      return;
    }
    int count = 60;
    setState(() {
      _resendText = "Try again in ${count}s";
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count--;
      if (count < 0) {
        timer.cancel();
        setState(() {
          _resendText = "Resend";
        });
      } else {
        setState(() {
          _resendText = "Try again in ${count}s";
        });
      }
    });
  }

  Future<void> _onSubmit() async {
    setState(() {
      _isLoading = true;
    });

    String code = _controller1.text +
        _controller2.text +
        _controller3.text +
        _controller4.text +
        _controller5.text;

    if (code.length == 5) {
      showModalBottomSheet(
          context: context, builder: (context) => _bottomSheet());
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          const SizedBox(height: 40),
          Center(
            child: Container(
              width: 148,
              height: 148,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.tertiary.withOpacity(.5),
              ),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.tertiary,
                  ),
                  child: const Center(
                    child: SvgIcon(
                      assetName: 'assets/icons/verification.svg',
                      size: 64,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 48),
          Center(child: Text("Verification Code", style: AppStyles.header)),
          const SizedBox(height: 12),
          Center(
            child: Text("Enter the code that we have given to",
                style: AppStyles.subbody),
          ),
          const SizedBox(height: 64),
          VerificationCode(
            controllers: [
              _controller1,
              _controller2,
              _controller3,
              _controller4,
              _controller5
            ],
          ),
          const SizedBox(height: 64),
          ButtonWidget(
            text: "Submit",
            onTap: () {
              _onSubmit();
            },
            isLoading: _isLoading,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Didn't reveice the code?", style: AppStyles.subbody),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: _resend,
                child: Text(_resendText, style: AppStyles.body),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _bottomSheet() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 84,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.5),
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            width: 148,
            height: 148,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.success.withOpacity(.5),
            ),
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.success,
                ),
                child: Center(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: AppColors.success,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 64),
          Text("Register Success", style: AppStyles.header),
          const SizedBox(height: 24),
          Text(
            "Congratulation! Your account has been created, please log in and search for the item you want",
            textAlign: TextAlign.center,
            style: AppStyles.subbody,
          ),
          const SizedBox(height: 32),
          ButtonWidget(
            text: "Next",
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          )
        ],
      ),
    );
  }
}
