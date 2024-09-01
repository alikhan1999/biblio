import 'package:biblio_bazar/all_utils.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final String caption;
  final Function(DateTime) onChanged;

  const DatePicker({required this.caption, required this.onChanged, Key? key})
      : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          widget.caption,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppTheme.blueColor,
        ),
        const VerticalSpacing(12),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultRadius),
              border: Border.all(
                  style: BorderStyle.solid, color: AppTheme.blueColor),
            ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyText(
                    DateFormat.yMMMd().format(selectedDate),
                    color: AppTheme.blueColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.date_range_outlined,
                    color: AppTheme.blueColor,
                  ),
                ],
              ),
            )),
          ),
        ),
      ],
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate) {
      setState(() => selectedDate = selected);
      widget.onChanged.call(selectedDate);
    }
  }
}
