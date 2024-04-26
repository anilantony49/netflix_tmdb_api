import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/colors.dart';
import 'package:netflix_app_clone/presentation/widgets/bottom_navigation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('main page'),),
      backgroundColor: backGroundColor,
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}