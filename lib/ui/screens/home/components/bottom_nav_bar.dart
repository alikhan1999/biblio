import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/ui/screens/home/components/custom_icon_button.dart';

class BottomNavBar extends StatelessWidget {
  final ValueChanged<int> onItemTapped;
  final int selectedIndex;

  const BottomNavBar({
    required this.onItemTapped,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomIconButton(
            icon: selectedIndex == 0 ? Icons.home : Icons.home_outlined,
            onTap: (_) => onItemTapped(0),
            color: selectedIndex == 0
                ? AppTheme.blueColor
                : AppTheme.darkGreyColor,
          ),
          CustomIconButton(
            icon: selectedIndex == 1
                ? Icons.shopping_cart
                : Icons.shopping_cart_outlined,
            onTap: (_) => onItemTapped(1),
            color: selectedIndex == 1
                ? AppTheme.blueColor
                : AppTheme.darkGreyColor,
          )
        ],
      ),
    );
  }
}
