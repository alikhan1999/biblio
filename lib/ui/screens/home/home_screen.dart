import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/common_widgets/my_drawer.dart';
import 'package:biblio_bazar/ui/screens/add_book/add_book_screen.dart';
import 'package:biblio_bazar/ui/screens/checkout/checkout_screen.dart';
import 'package:biblio_bazar/ui/screens/home/components/book_list_view.dart';
import 'package:biblio_bazar/ui/screens/home/components/bottom_nav_bar.dart';
import 'package:biblio_bazar/ui/screens/home/components/tabbar_views.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  int _selectedIndex = 0;

  final List<String> appBarTitles = [
    'BIBLIO BAZAAR',
    'My Cart',
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        title: MyText(
          appBarTitles[_selectedIndex],
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.blackColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.blackColor),
      ),
      drawer: const MyDrawer(),
      body: Consumer<BookProvider>(
        builder: (context, provider, child) => FutureBuilder(
          future: provider.fetchAllBooks(),
          builder: (context, snapshot) {
            provider.findBookSeller();
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              if (snapshot.data == true) {
                return IndexedStack(
                  index: _selectedIndex,
                  children: [
                    TabBarViews(books: provider.booksInMarketplace),
                    BookListView(provider.booksInCart, deleteButton: true),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Could not load data. Please restart the app!'),
                    const VerticalSpacing(12),
                    MyElevatedButton(
                      onTap: () => provider.fetchAllBooks(),
                      label: 'Try again!',
                      isExpanded: false,
                    )
                  ],
                );
              }
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Center(
                child: CircularProgressIndicator(color: AppTheme.yellowColor),
              );
            }
          },
        ),
      ),
      fab: MyElevatedButton(
        onTap: () {
          final provider = context.read<BookProvider>();
          provider.booksAmountCalculation(provider.booksInCart);
          _selectedIndex == 0
              ? context.push(AddBookScreen.routeName)
              : context.push(CheckoutScreen.routeName);
        },
        label: _selectedIndex == 0 ? 'Add book' : 'Checkout',
        icon: _selectedIndex == 0 ? Icons.add : Icons.check_box_outlined,
        buttonColor: AppTheme.yellowColor,
        labelColor: AppTheme.blackColor,
        radius: 20,
        isExpanded: false,
      ),
      bottom: BottomNavBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);
}
