import 'package:biblio_bazar/all_utils.dart';

class BookImage extends StatelessWidget {
  final String imagePath;
  final double height;
  final double? width;
  final bool roundedCorners;

  const BookImage(
    this.imagePath, {
    this.height = 100,
    this.width,
    this.roundedCorners = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? height,
      decoration: BoxDecoration(
        color: const Color(0xffd8d8d8),
        borderRadius: roundedCorners
            ? const BorderRadius.all(Radius.circular(kDefaultRadius))
            : null,
      ),
      child: _buildImage(),
    );
  }

  Widget _buildImage() {
    if (imagePath.isEmpty) {
      return Icon(Icons.image_outlined,
          color: AppTheme.blueColor, size: height / 3);
    }

    return FittedBox(fit: BoxFit.fill, child: Image.network(imagePath));
  }
}
