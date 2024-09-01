import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/screens/login/login_screen.dart';
import 'package:biblio_bazar/ui/screens/orders/orders_screen.dart';
import 'package:biblio_bazar/ui/screens/product/product_items.dart';
import 'package:biblio_bazar/ui/screens/settings/settings_screen.dart';
import 'package:biblio_bazar/ui/screens/uploaded_books/uplaoded_books_screen.dart';
import 'package:biblio_bazar/ui/screens/wish_list/wish_list_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppTheme.ghostWhiteColor),
            child: Image.asset(kImageLogoWithText),
          ),
          ListTile(
            title: const Text('Wish List'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              context.read<BookProvider>().getFavorite();
              // Pops the drawer first
              Navigator.pop(context);

              context.push(WishListScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Uploaded books'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Pops the drawer first
              Navigator.pop(context);
              context.push(UploadedBooksScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Orders received'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Pops the drawer first
              Navigator.pop(context);
              context.push(OrdersScreen.routeName);
            },
          ),

          ListTile(
            title: const Text('Posts'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Pops the drawer first
              Navigator.pop(context);
              context.push(PostListScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('My Profile'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Pops the drawer first
              Navigator.pop(context);
              context.push(SettingsScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Logout'),
            trailing: const Icon(Icons.logout),
            onTap: () => onTapLogout(context),
          ),
        ],
      ),
    );
  }

  void onTapLogout(BuildContext context) async {
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
