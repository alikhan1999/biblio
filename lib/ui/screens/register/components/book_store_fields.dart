import 'package:biblio_bazar/all_utils.dart';

class BookStoreField extends StatelessWidget {
  final TextEditingController  bookNameController;
  final TextEditingController  bookAddressController;
  const BookStoreField({Key? key, required this.bookNameController, required this.bookAddressController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const VerticalSpacing(12),
      MyTextFormField(
        caption: 'Book Store Name',
        controller: bookNameController,
        hintText: 'Store Name',

        // onFieldSubmitted: (value) => onTapRegister(context),
      ),
      const VerticalSpacing(12),
      MyTextFormField(
        caption: 'Book Store Address',
        controller: bookAddressController,
        hintText: 'Store Address',

        // nFieldSubmitted: (value) => onTapRegister(context),o
      ),

    ],);
  }
}