import 'package:biblio_bazar/utils/app_theme.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final IconData? icon;
  final bool isUnderline;

  const MyTextButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.size = 14,
    this.color = AppTheme.blueColor,
    this.fontWeight = FontWeight.w600,
    this.icon,
    this.isUnderline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    icon,
                    size: size,
                    color: color,
                  ),
                )
              : const SizedBox.shrink(),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: size,
              fontWeight: fontWeight,
              decoration: isUnderline ? TextDecoration.underline : null,
              decorationThickness: 1,
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
