import 'dart:io';

import 'package:biblio_bazar/all_utils.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePicture extends StatefulWidget {
  final String? imagePath;
  final void Function(File) onChanged;

  const EditProfilePicture(
      {required this.imagePath, required this.onChanged, Key? key})
      : super(key: key);

  @override
  State<EditProfilePicture> createState() => _EditProfilePictureState();
}

class _EditProfilePictureState extends State<EditProfilePicture> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _imgFromGallery(),
      child: Stack(
        children: [
          ClipOval(
            child: Container(
              width: 120,
              height: 120,
              color: AppTheme.blueColor,
              child: _buildImage(),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black),
              child: const Center(
                child: Icon(Icons.edit_outlined, color: Colors.white, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _imgFromGallery() async {
    final file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (file != null) {
        _image = File(file.path);
        if (_image != null) widget.onChanged(_image!);
      }
    });
  }

  Widget _buildImage() {
    if (_image != null) {
      return FittedBox(fit: BoxFit.cover, child: Image.file(_image!));
    }

    if (widget.imagePath != null && widget.imagePath!.isNotEmpty) {
      return FittedBox(
          fit: BoxFit.cover, child: Image.network(widget.imagePath!));
    }

    return const Icon(Icons.person, color: AppTheme.whiteColor, size: 50);
  }
}
