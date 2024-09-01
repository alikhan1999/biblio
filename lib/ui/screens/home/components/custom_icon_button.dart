import 'package:biblio_bazar/all_utils.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function(BuildContext context) onTap;
  final Color color;

  const CustomIconButton({
    required this.icon,
    required this.onTap,
    this.color = AppTheme.darkGreyColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: color),
      onPressed: () => onTap(context),
    );
  }
}
