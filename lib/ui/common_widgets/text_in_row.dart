import 'package:biblio_bazar/all_utils.dart';

class TextInRowWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const TextInRowWidget({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          title,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
        MyText(
          subTitle,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
      ],
    );
  }
}
