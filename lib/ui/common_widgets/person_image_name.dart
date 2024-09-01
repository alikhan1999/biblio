import 'package:biblio_bazar/all_utils.dart';

class PersonImageName extends StatelessWidget {
  final String? imagePath;
  final String name;

  const PersonImageName({
    Key? key,
    required this.imagePath,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 32,
          child: CircleAvatar(
            backgroundColor: AppTheme.lightPurpleColor,
            child: imagePath == null || imagePath!.isEmpty
                ? const Icon(Icons.person, color: AppTheme.blueColor, size: 16)
                : FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(imagePath!, width: 32, height: 32),
                  ),
          ),
        ),
        const HorizontalSpacing(8),
        Flexible(
          child: MyText(
            name,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
