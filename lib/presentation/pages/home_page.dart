import 'package:eazyshop/presentation/widgets/loader.dart';
import 'package:eazyshop/presentation/widgets/navbar.dart';
import 'package:eazyshop/presentation/widgets/tab_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final int currentIndex;
  const HomePage({
    this.currentIndex = 0,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    Widget body = const Loader();

    switch (_currentIndex) {
      case 0:
        body = const TabHome();
        break;
      case 1:
        body = const Text("My Order");
        break;
      case 2:
        body = const Text("Favorite");
        break;
      case 3:
        body = const Text("Profile");
        break;
    }

    return Scaffold(
      body: body,
      bottomNavigationBar: NavbarWidget(
        currentIndex: _currentIndex,
        onIndexChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
