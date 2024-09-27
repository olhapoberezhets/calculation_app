import 'package:calculation_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
      ),
      centerTitle: false,
      backgroundColor: AppColors.blue,
      foregroundColor: AppColors.white,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 55.0);
}
