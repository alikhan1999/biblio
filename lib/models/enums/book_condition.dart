import 'package:biblio_bazar/all_utils.dart';

enum BookCondition {
  brandNew,
  openBox,
  veryGood,
  good,
  fair,
  poor,
}

extension BookConditionExtension on BookCondition {
  String get value {
    switch (this) {
      case BookCondition.brandNew:
        return 'New';
      case BookCondition.openBox:
        return 'Open box';
      case BookCondition.veryGood:
        return 'Very Good';
      case BookCondition.good:
        return 'Good';
      case BookCondition.fair:
        return 'Fair';
      case BookCondition.poor:
        return 'Poor';
    }
  }

  Widget get card {
    Color color = AppTheme.greenColor;

    switch (this) {
      case BookCondition.brandNew:
        break;
      case BookCondition.openBox:
        color = AppTheme.blueColor;
        break;
      case BookCondition.veryGood:
        color = AppTheme.purpleColor;
        break;
      case BookCondition.good:
        color = AppTheme.lightPurpleColor;
        break;
      case BookCondition.fair:
        color = AppTheme.yellowColor;
        break;
      case BookCondition.poor:
        color = AppTheme.redColor;
        break;
    }

    return Container(
      height: 26,
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(37)),
        border: Border.all(color: AppTheme.lightPurpleColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8, child: CircleAvatar(backgroundColor: color)),
            const HorizontalSpacing(8),
            Text(value, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
