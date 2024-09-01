import 'package:biblio_bazar/all_utils.dart';

class TitleValueText extends StatelessWidget {
  final String title;
  final String value;
  final CrossAxisAlignment crossAxisAlignment;
  final Color titleColor;
  final Color valueColor;
  final double titleFontSize;
  final double valueFontSize;
  final FontWeight titleFontWeight;
  final FontWeight valueFontWeight;

  const TitleValueText({
    required this.title,
    required this.value,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.titleColor = AppTheme.darkGreyColor,
    this.valueColor = AppTheme.blackColor,
    this.titleFontSize = 14,
    this.valueFontSize = 16,
    this.titleFontWeight = FontWeight.w500,
    this.valueFontWeight = FontWeight.w400,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        MyText(
          title,
          color: titleColor,
          fontSize: titleFontSize,
          fontWeight: titleFontWeight,
        ),
        const VerticalSpacing(6),
        MyText(
          value,
          color: valueColor,
          fontSize: valueFontSize,
          fontWeight: valueFontWeight,
        ),
      ],
    );
  }
}
