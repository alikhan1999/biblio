import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/common_widgets/text_in_row.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<BookProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyText(
          'Order Summary',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        const VerticalSpacing(10),
        TextInRowWidget(
            title: 'Item Total', subTitle: provider.totalPrice.toString()),
        TextInRowWidget(
            title: 'Delivery Fee',
            subTitle: provider.totalDeliveryFee.toString()),
        TextInRowWidget(
            title: 'Total Payment', subTitle: provider.total.toString())
      ],
    );
  }
}
