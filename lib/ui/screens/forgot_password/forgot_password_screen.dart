import 'package:biblio_bazar/all_utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/ForgotPasswordScreen';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.blackColor),
      ),
      body: CustomScrollView(
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
                    'Forgot Password?',
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
                          caption: 'Email',
                          controller: emailController,
                          hintText: 'user@email.com',
                          keyboardType: TextInputType.emailAddress,
                          isRequired: true,
                          onFieldSubmitted: (value) => onTapNext(context),
                        ),
                        const VerticalSpacing(24),
                        MyElevatedButton(
                          onTap: () => onTapNext(context),
                          label: 'Send recovery email',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void onTapNext(BuildContext context) async {
    if (emailController.text.contains('@') == false) {
      EasyLoading.showError('Enter a valid email.');
      return;
    }

    final email = emailController.text.toString().trim();
    // try {
    //   await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    // } on FirebaseAuthException catch (e) {
    //   EasyLoading.showError(e.toString());
    //   return;
    // }

    if (!mounted) return;
    Navigator.pop(context);

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const MyText('Password Reset', fontSize: 22),
        content: MyText(
          'We have sent you password reset instructions on $email',
          fontSize: 16,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const MyText('Okay', color: AppTheme.blueColor),
          ),
        ],
      ),
    );
  }
}
