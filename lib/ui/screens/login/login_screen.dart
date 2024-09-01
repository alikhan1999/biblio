import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/models/local_user.dart';
import 'package:biblio_bazar/ui/screens/forgot_password/forgot_password_screen.dart';
import 'package:biblio_bazar/ui/screens/home/home_screen.dart';
import 'package:biblio_bazar/ui/screens/register/register_screen.dart';


class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(kImageLogoWithText, height: 100),
                  const VerticalSpacing(48),
                  const MyText(
                    'Login',
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
                          onFieldSubmitted: (value) => onTapLogin(context),
                        ),
                        const VerticalSpacing(24),
                        MyTextFormField(
                          caption: 'Password',
                          controller: passwordController,
                          hintText: 'Type your password',
                          obscure: true,
                          isRequired: true,
                          onFieldSubmitted: (value) => onTapLogin(context),
                        ),
                        const VerticalSpacing(24),
                        Align(
                          alignment: Alignment.centerRight,
                          child: MyTextButton(
                            onTap: () =>
                                context.push(ForgotPasswordScreen.routeName),
                            text: 'Forgot password?',
                            isUnderline: true,
                          ),
                        ),
                        const VerticalSpacing(24),
                        MyElevatedButton(
                          onTap: () => onTapLogin(context),
                          label: 'Login',
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpacing(24),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MyText('Don\'t have an account?',
                          fontWeight: FontWeight.w600),
                      const HorizontalSpacing(4),
                      MyTextButton(
                        onTap: () =>
                            context.pushReplacement(RegisterScreen.routeName),
                        text: 'Register',
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
    );
  }

  void onTapLogin(BuildContext context) async {
    final FocusScopeNode currentFocus = FocusScope.of(context);

    // context.pushReplacement(HomeScreen.routeName);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();

    if (emailController.text.contains('@') == false ) {
      EasyLoading.showError('Enter a valid email');
      return;
    }else{


      final updatedUser = LocalUser(
          email: emailController.text,
          name: "Test",
          phone: "+923077373488",
          imagePath: null,
          fcm: "wueuwrwueorwuoer");

      await Prefs.instance.setUser(updatedUser);
      if (!mounted) return;
      context.pushReplacement(HomeScreen.routeName);
    }

    }



}
