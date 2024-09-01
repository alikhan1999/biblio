import 'package:biblio_bazar/all_utils.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final Color? color;

  const MyCard({
    required this.child,
    this.shape,
    this.margin,
    this.padding,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 3,
      shape: shape ??
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultRadius)),
      margin: margin,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
