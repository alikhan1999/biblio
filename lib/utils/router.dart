import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/models/book.dart';
import 'package:biblio_bazar/ui/screens/add_book/add_book_screen.dart';
import 'package:biblio_bazar/ui/screens/book_details/book_details_screen.dart';
import 'package:biblio_bazar/ui/screens/checkout/checkout_screen.dart';
import 'package:biblio_bazar/ui/screens/forgot_password/forgot_password_screen.dart';
import 'package:biblio_bazar/ui/screens/home/home_screen.dart';
import 'package:biblio_bazar/ui/screens/login/login_screen.dart';
import 'package:biblio_bazar/ui/screens/orders/orders_screen.dart';
import 'package:biblio_bazar/ui/screens/product/product_items.dart';
import 'package:biblio_bazar/ui/screens/register/register_screen.dart';
import 'package:biblio_bazar/ui/screens/settings/settings_screen.dart';
import 'package:biblio_bazar/ui/screens/store_details/store_details_screen.dart';
import 'package:biblio_bazar/ui/screens/uploaded_books/uplaoded_books_screen.dart';
import 'package:biblio_bazar/ui/screens/wish_list/wish_list_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: LoginScreen.routeName,
  routerNeglect: true,

  /// Used for redirection to route other than initial route
  redirect: (context, state) async {
    final prefsUser = Prefs.instance.user;
    final notLoggedIn = state.fullPath == LoginScreen.routeName ||
        state.fullPath == RegisterScreen.routeName ||
        state.fullPath == ForgotPasswordScreen.routeName;

    // if the user is not logged in, keep them on login screen
    if (prefsUser == null) {
      return notLoggedIn ? null : LoginScreen.routeName;
    }
    // if the user is logged in but still on the login screen,
    // send them to the home page
    else if (notLoggedIn) {
      return HomeScreen.routeName;
    }

    // no need to redirect at all
    return null;
  },
  routes: [
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: ForgotPasswordScreen.routeName,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: RegisterScreen.routeName,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: BookDetailsScreen.routeName,
      builder: (context, state) {
        final book = state.extra as Book?;
        return BookDetailsScreen(book);
      },
    ),
    GoRoute(
      path: StoreDetailsScreen.routeName,
      builder: (context, state) {
        final book = state.extra as Book?;
        return StoreDetailsScreen(book);
      },
    ),
    GoRoute(
      path: AddBookScreen.routeName,
      builder: (context, state) => const AddBookScreen(),
    ),
    GoRoute(
      path: WishListScreen.routeName,
      builder: (context, state) => const WishListScreen(),
    ),
    GoRoute(
      path: UploadedBooksScreen.routeName,
      builder: (context, state) => const UploadedBooksScreen(),
    ),
    GoRoute(
      path: OrdersScreen.routeName,
      builder: (context, state) => const OrdersScreen(),
    ),
    GoRoute(
      path: SettingsScreen.routeName,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: CheckoutScreen.routeName,
      builder: (context, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: PostListScreen.routeName,
      builder: (context, state) =>  const PostListScreen(),
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.error.toString()),
          ],
        ),
      ),
    ),
  ),
);
