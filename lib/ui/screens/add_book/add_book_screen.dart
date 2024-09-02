import 'dart:io';

import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/models/book.dart';
import 'package:biblio_bazar/models/enums/book_category.dart';
import 'package:biblio_bazar/models/enums/book_condition.dart';
import 'package:biblio_bazar/models/local_user.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/screens/add_book/components/book_category_dropdown.dart';
import 'package:biblio_bazar/ui/screens/add_book/components/book_condition_dropdown.dart';
import 'package:biblio_bazar/ui/screens/add_book/components/image_uploader.dart';
import 'package:flutter/cupertino.dart';

class AddBookScreen extends StatefulWidget {
  static const routeName = '/AddBookScreen';

  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> with WidgetsBindingObserver {
  final formKey = GlobalKey<FormState>();

  File? image;

  void _imageUploaderCallback(File? file) => image = file;

  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final isbnController = TextEditingController();
  final priceController = TextEditingController();
  final deliveryFeeController = TextEditingController();
  final descriptionController = TextEditingController();

  BookCategory? category;
  String? changes ;

  void onCategoryChangeCallback(BookCategory? value) =>
      setState(() => category = value);

  BookCondition? condition;

  void onConditionChangeCallback(BookCondition? value) =>
      setState(() => condition = value);

  bool hasHardCover = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    authorController.dispose();
    isbnController.dispose();
    priceController.dispose();
    deliveryFeeController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.blackColor,
        title: const MyText(
          'Add Book',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageUploader(_imageUploaderCallback),
              const VerticalSpacing(12),
              MyTextFormField(
                controller: titleController,
                caption: 'Title',
                hintText: 'Book title',
                isRequired: true,
              ),
              const VerticalSpacing(12),
              MyTextFormField(
                controller: authorController,
                caption: 'Author',
                hintText: 'Author name',
                isRequired: true,
              ),
              const VerticalSpacing(12),
              MyTextFormField(
                controller: isbnController,
                caption: 'ISBN',
                hintText: 'ISBN number',
                keyboardType: TextInputType.number,
              ),
              const VerticalSpacing(12),
              BookCategoryDropdown(onChanged: onCategoryChangeCallback),
              const VerticalSpacing(12),
              BookConditionDropdown(onChanged: onConditionChangeCallback),
              const VerticalSpacing(12),
              Row(
                children: [
                  const MyText(
                    'Has hard cover?',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  CupertinoSwitch(
                    activeTrackColor: AppTheme.yellowColor,
                    value: hasHardCover,
                    onChanged: (value) => setState(() => hasHardCover = value),
                  ),
                ],
              ),
              const VerticalSpacing(12),
              Row(
                children: [
                  Expanded(
                    child: MyTextFormField(
                      controller: priceController,
                      caption: 'Price',
                      keyboardType: TextInputType.number,
                      initialValue: '0',
                      isRequired: true,
                    ),
                  ),
                  const HorizontalSpacing(24),
                  Expanded(
                    child: MyTextFormField(
                      controller: deliveryFeeController,
                      caption: 'Delivery Fee',
                      keyboardType: TextInputType.number,
                      initialValue: '0',
                      isRequired: true,
                    ),
                  ),
                ],
              ),
              const VerticalSpacing(12),
              MyTextFormField(
                controller: descriptionController,
                caption: 'Description',
                maxLines: 5,
              ),
              const VerticalSpacing(24),
              MyElevatedButton(label: 'Add book', onTap: onTapAddBook),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed){
      //TODO: set status to online here in firestore
      setState(() {
        changes = "User is online";
      });
    }else{
      //TODO: set status to offline here in firestore
      setState(() {
        changes = "User is Offline";
      });
    }


    print('CHANGES IS : $changes ');


  }

  void onTapAddBook() async {
    final currentuser=Prefs.instance.user!;
    // final user =await  userRepository.get(currentId);
    // if (user == null) {
    //   EasyLoading.showError('Session expired');
    //   return;
    // }

    try {
      EasyLoading.show();
      if ((formKey.currentState?.validate() ?? false) && image != null) {
        // final id = '${titleController.text}-${user.email}';

        /// Uploading book image to Firebase Storage and generating a link
        // final imageFile = FirebaseStorage.instance.ref().child('books/$id.jpg');
        // final snapshot = await imageFile.putFile(image!);
        // final imagePath = await snapshot.ref.getDownloadURL();

        final book = Book(
          "",//id
          titleController.text,
          authorController.text,
          isbnController.text,
          category!,
          condition!,
          priceController.text,
          deliveryFeeController.text,
          // imagePath,
          "https://i.postimg.cc/CM4Sw3Rj/book-demo-one.jpg",
          hasHardCover,
          descriptionController.text,
          const LocalUser(
              email: 'Ahmad@gmail.com', name: 'Ahmad', phone: '+92302323232'),
          currentuser,
        );

        if (!mounted) {
          EasyLoading.dismiss();
          EasyLoading.showError('Unknown error occurred');
          return;
        }
        context.read<BookProvider>().addBook(book);
        EasyLoading.dismiss();
        Navigator.pop(context);
        EasyLoading.showSuccess('Book added successfully');
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError('Fill required fields!');
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Error: $e');
    }
  }
}
