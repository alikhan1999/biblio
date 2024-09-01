import 'dart:io';

import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/models/local_user.dart';
import 'package:biblio_bazar/ui/screens/login/login_screen.dart';
import 'package:biblio_bazar/ui/screens/settings/components/edit_profile_picture.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/SettingsScreen';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  File? image;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.blackColor,
        title: const MyText(
          'Profile',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: [
            EditProfilePicture(
                imagePath: Prefs.instance.user?.imagePath,
                onChanged: editProfilePictureCallback),
            const VerticalSpacing(24),
            MyText(
              Prefs.instance.user?.email ?? '',
              fontSize: 17,
              color: AppTheme.darkGreyColor,
            ),
            const VerticalSpacing(24),
            MyTextFormField(
              controller: nameController,
              caption: 'Name',
              initialValue: Prefs.instance.user?.name,
            ),
            const VerticalSpacing(24),
            const Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Text(
                    'Phone',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    ' *',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.redColor,
                    ),
                  ),
                ],
              ),
            ),
            IntlPhoneField(
              initialValue: Prefs.instance.user?.phone,
              onChanged: (phone) =>
                  setState(() => phoneController.text = phone.completeNumber),
              flagsButtonPadding: const EdgeInsets.all(8),
              dropdownIconPosition: IconPosition.trailing,
              dropdownTextStyle: const TextStyle(fontSize: 14),
              dropdownIcon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppTheme.blackColor,
              ),
              style: const TextStyle(fontSize: 14),
              cursorColor: AppTheme.blackColor,
              decoration: InputDecoration(
                fillColor: AppTheme.ghostWhiteColor,
                filled: true,
                hoverColor: Colors.transparent,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kDefaultRadius),
                  borderSide:
                      const BorderSide(color: AppTheme.lightPurpleColor),
                ),
                hintText: 'Phone',
                hintStyle: const TextStyle(
                    fontSize: 14, color: AppTheme.darkGreyColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kDefaultRadius),
                  borderSide: const BorderSide(color: AppTheme.blueColor),
                ),
              ),
              validator: (value) {
                if (value == null || value.number.isEmpty) {
                  return 'Phone is required';
                }
                return null;
              },
            ),
            const VerticalSpacing(12),
            MyElevatedButton(
              label: 'Update',
              onTap: () => onTapUpdateButton(context),
            ),
          ],
        ),
      ),
    );
  }

  void editProfilePictureCallback(File file) => image = file;

  Future<String?> _uploadFile(String id) async {
    if (image != null) {
      // final imageFile = FirebaseStorage.instance.ref().child(
      //       'users/$id/profilePicture.jpg',
      //     );
      // final snapshot = await imageFile.putFile(image!);
      // final url = await snapshot.ref.getDownloadURL();
      return "";
    }
    return null;
  }

  void onTapUpdateButton(BuildContext context) async {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();

    final user = Prefs.instance.user;
    if (user?.email == null) {
      EasyLoading.showError('No account logged in');
      return null;
    }

    EasyLoading.show();

    final imagePath = await _uploadFile(user!.email);
    final localUser = LocalUser(
      name: nameController.text,
      email: user.email,
      phone: phoneController.text,
      imagePath: imagePath ?? user.imagePath,
    );
    // await userRepository.add(localUser);
    await Prefs.instance.setUser(localUser);

    EasyLoading.dismiss();
    EasyLoading.showSuccess('Profile updated successfully!');
  }

  void onTapLogout() async {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const MyText(
          'Do you want to logout?',
          fontWeight: FontWeight.bold,
        ),
        actions: [
          TextButton(
            onPressed: () async {
              EasyLoading.show();
              // await FirebaseAuth.instance.signOut();
              Prefs.instance.removeUser();
              EasyLoading.dismiss();

              if (!mounted) return;
              Navigator.popUntil(context, (route) => route.isFirst);
              context.pushReplacement(LoginScreen.routeName);
            },
            child: const MyText('Logout', color: AppTheme.blueColor),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const MyText('Cancel'),
          ),
        ],
      ),
    );
  }
}
