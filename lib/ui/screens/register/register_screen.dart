import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/ui/screens/login/login_screen.dart';
import 'package:biblio_bazar/ui/screens/register/components/book_store_fields.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bookNameController = TextEditingController();
  final bookAddressController = TextEditingController();
  bool isSwitched = false;
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(kImageLogoWithText, height: 120),
                    const VerticalSpacing(48),
                    const MyText(
                      'Register',
                      fontSize: 16,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                    ),
                    const VerticalSpacing(36),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyTextFormField(
                            caption: 'Name',
                            controller: nameController,
                            hintText: 'Dexter',
                            keyboardType: TextInputType.text,
                            isRequired: true,
                            onFieldSubmitted: (value) => onTapRegister(context),
                          ),
                          const VerticalSpacing(12),
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
                            initialCountryCode: 'PK',
                            controller: phoneController,
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
                                borderRadius:
                                    BorderRadius.circular(kDefaultRadius),
                                borderSide: const BorderSide(
                                    color: AppTheme.lightPurpleColor),
                              ),
                              hintText: 'Phone',
                              hintStyle: const TextStyle(
                                  fontSize: 14, color: AppTheme.darkGreyColor),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(kDefaultRadius),
                                borderSide:
                                    const BorderSide(color: AppTheme.blueColor),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.number.isEmpty) {
                                return 'Phone is required';
                              }
                              return null;
                            },
                          ),
                          MyTextFormField(
                            caption: 'Email',
                            controller: emailController,
                            hintText: 'user@email.com',
                            keyboardType: TextInputType.emailAddress,
                            isRequired: true,
                            onFieldSubmitted: (value) => onTapRegister(context),
                          ),
                          const VerticalSpacing(12),
                          MyTextFormField(
                            caption: 'Password',
                            controller: passwordController,
                            hintText: 'Type your password',
                            obscure: true,
                            isRequired: true,
                            onFieldSubmitted: (value) => onTapRegister(context),
                          ),
                          const VerticalSpacing(12),
                          MyTextFormField(
                            caption: 'Confirm Password',
                            controller: confirmPasswordController,
                            hintText: 'Retype your password',
                            obscure: true,
                            isRequired: true,
                            onFieldSubmitted: (value) => onTapRegister(context),
                          ),
                          const VerticalSpacing(12),
                          Row(

                            children: [
                              const MyText('Is Book Store', fontWeight: FontWeight.w500),
                              Transform.scale(
                                  scale: 1,
                                  child: Switch(
                                    onChanged: toggleSwitch,
                                    value: isSwitched,
                                    activeColor: AppTheme.blueColor,
                                    activeTrackColor: Colors.grey.withOpacity(0.6),
                                    inactiveThumbColor: Colors.grey,
                                    inactiveTrackColor: Colors.grey.withOpacity(0.6),
                                  )
                              ),
                            ],
                          ),
                         isSwitched ?BookStoreField(bookNameController: bookNameController,bookAddressController: bookAddressController): const SizedBox(),
                          const VerticalSpacing(24),
                          MyElevatedButton(
                            onTap: () => onTapRegister(context),
                            label: 'Register',
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpacing(24),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const MyText('Already have an account?',
                            fontWeight: FontWeight.w600),
                        const HorizontalSpacing(4),
                        MyTextButton(
                          onTap: () =>
                              context.pushReplacement(LoginScreen.routeName),
                          text: 'Login',
                          isUnderline: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void toggleSwitch(bool value) {
    if (isSwitched) {
      setState(() => isSwitched = false);
    } else {
      setState(() => isSwitched = true);
    }
  }
  void onTapRegister(BuildContext context) async {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();

    if (emailController.text.contains('@') == false) {
      EasyLoading.showError('Enter a valid email.');
    } else if (passwordController.text.isEmpty ||
        passwordController.text != confirmPasswordController.text) {
      EasyLoading.showError('Passwords do no match.');
    } else {

        EasyLoading.show();

          // final localUser = LocalUser(
          //   name: nameController.text,
          //   email: emailController.text,
          //   phone: phoneController.text,
          //   storeAddress:bookAddressController.text ,
          //   storeName: bookNameController.text
          // );


          EasyLoading.dismiss();

          if (!mounted) return;

          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const MyText('Registration successful!', fontSize: 22),
              content: MyText(
                'We have sent you a verification email on ${emailController.text}. Verify to start using Biblio Bazaar.',
                fontSize: 16,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.pushReplacement(LoginScreen.routeName);
                  },
                  child: const MyText('Okay', color: AppTheme.blueColor),
                ),
              ],
            ),
          );
        }
      }




    }


