import 'package:flutter/material.dart';
import 'package:strap_the_stoke/customheader.dart';
import 'package:strap_the_stoke/custombottomnav.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final int currentIndex;
  final Function(int) onNavTap;

  const BaseScreen({
    super.key,
    required this.title,
    required this.body,
    required this.currentIndex,
    required this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: CustomHeader(title: title),
      body: body,
      bottomNavigationBar: CustomBottomNav(
        context: context,
        currentIndex: currentIndex,
      ),
    );
  }
}
