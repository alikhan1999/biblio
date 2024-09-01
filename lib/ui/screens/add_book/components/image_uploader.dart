import 'dart:io';

import 'package:biblio_bazar/all_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploader extends StatefulWidget {
  final void Function(File? file) onChanged;
  final String? imagePath;

  const ImageUploader(this.onChanged, {Key? key, this.imagePath})
      : super(key: key);

  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: AppTheme.ghostWhiteColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              style: BorderStyle.solid, color: AppTheme.lightPurpleColor),
          image: _image == null
              ? null
              : DecorationImage(image: FileImage(_image!), fit: BoxFit.cover),
        ),
        child: _image == null ? _buildPlaceholder() : const SizedBox.shrink(),
      ),
      onTap: () => _imgFromGallery(),
    );
  }

  Future _imgFromGallery() async {
    final file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (file != null) {
      setState(() => _image = File(file.path));
      widget.onChanged(_image);
    }
  }

  Widget _buildPlaceholder() {
    if (widget.imagePath != null && widget.imagePath!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(widget.imagePath!, fit: BoxFit.cover),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.image,
          color: AppTheme.darkGreyColor,
          size: 50,
        ),
        MyText('UPLOAD IMAGE', fontSize: 20, color: AppTheme.darkGreyColor),
      ],
    );
  }
}
