import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../section/body_section.dart';
import '../section/header_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XAppColors.primary,
      body: ListView(
        children: [
          HeaderSection(),
          BodySection(),
        ],
      ),
    );
  }
}
