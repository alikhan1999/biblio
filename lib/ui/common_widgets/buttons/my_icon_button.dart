import 'package:biblio_bazar/utils/app_theme.dart';
import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final double size;
  final Color color;
  final Color iconColor;
  final double radius;

  const MyIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.size = 32,
    this.color = AppTheme.lightGreyColor,
    this.iconColor = AppTheme.blackColor,
    this.radius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: Icon(icon, size: size / 1.7, color: iconColor),
      ),
    );
  }
}
