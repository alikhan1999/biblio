import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/models/enums/book_condition.dart';

class BookConditionDropdown extends StatefulWidget {
  final Function(BookCondition? category) onChanged;

  const BookConditionDropdown({
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<BookConditionDropdown> createState() => _BookConditionDropdownState();
}

class _BookConditionDropdownState extends State<BookConditionDropdown> {
  BookCondition? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MyText('Book Condition', fontWeight: FontWeight.w500),
            MyText(
              ' *',
              fontWeight: FontWeight.w500,
              color: AppTheme.redColor,
            ),
          ],
        ),
        const VerticalSpacing(4),
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: AppTheme.ghostWhiteColor,
            borderRadius: BorderRadius.circular(kDefaultRadius),
            border: Border.all(
                style: BorderStyle.solid, color: AppTheme.lightPurpleColor),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<BookCondition>(
                      iconSize: 0.0,
                      isExpanded: true,
                      value: _selectedValue,
                      items: BookCondition.values
                          .map<DropdownMenuItem<BookCondition>>(
                              (BookCondition value) {
                        return DropdownMenuItem<BookCondition>(
                          value: value,
                          child: MyText(
                            value.value,
                            color: AppTheme.blueColor,
                            fontSize: 16,
                          ),
                        );
                      }).toList(),
                      hint: const MyText(
                        'Select',
                        fontSize: 16,
                        color: AppTheme.darkGreyColor,
                      ),
                      onChanged: (BookCondition? value) {
                        setState(() => _selectedValue = value);
                        widget.onChanged.call(value);
                      },
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 12),
              ],
            ),
          )),
        ),
      ],
    );
  }
}
