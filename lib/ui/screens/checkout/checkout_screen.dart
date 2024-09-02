import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/screens/checkout/components/checkout_item.dart';
import 'package:biblio_bazar/ui/screens/checkout/components/order_summry.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = '/CheckoutScreen';

  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final addressController = TextEditingController();

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    Provider.of<BookProvider>(context, listen: false).clearAmount();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final user = Prefs.instance.user;
    return Scaffold(
      floatingActionButton: MyElevatedButton(
        onTap: () {
          context.read<BookProvider>().placeOrder();
          Navigator.pop(context);
          EasyLoading.showSuccess('Order Successfully Place');
        },
        label: 'Place Order',
        buttonColor: AppTheme.yellowColor,
        labelColor: AppTheme.blackColor,
        radius: 20,
        isExpanded: false,
      ),
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        title: const MyText(
          'Checkout',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.blackColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.blackColor),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        children: [
          MyText(
            'Deliver to : ${user?.name ?? '-'}',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          const VerticalSpacing(20),
          MyTextFormField(
            caption: 'Address',
            controller: addressController,
            hintText: 'Ali Street, NYC',
            keyboardType: TextInputType.text,
            maxLines: 4,
            isRequired: true,
            // onFieldSubmitted: (value) => onTapLogin(context),
          ),
          const CheckoutItem(),
          const VerticalSpacing(20),
          const OrderSummary(),
        ],
      ),
    );
  }
}
