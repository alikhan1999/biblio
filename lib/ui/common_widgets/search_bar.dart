import 'package:biblio_bazar/utils/app_theme.dart';
import 'package:biblio_bazar/utils/constants.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final bool autofocus;

  const SearchBar({
    required this.hintText,
    required this.onChanged,
    this.autofocus = false,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final controller = TextEditingController();

  void _clear() {
    setState(() {
      controller.clear();
    });
    widget.onChanged('');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: widget.autofocus,
      textAlignVertical: TextAlignVertical.center,
      onChanged: (s) {
        if (s.length < 2) setState(() {});
        widget.onChanged.call(s);
      },
      cursorColor: AppTheme.blackColor,
      style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppTheme.blackColor),
      decoration: InputDecoration(
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: const BorderSide(color: AppTheme.blueColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: const BorderSide(color: AppTheme.lightPurpleColor),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        fillColor: AppTheme.ghostWhiteColor,
        hoverColor: AppTheme.ghostWhiteColor,
        focusColor: AppTheme.ghostWhiteColor,
        filled: true,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppTheme.darkGreyColor),
        suffixIcon: IconButton(
          onPressed: controller.text.isNotEmpty ? _clear : null,
          padding: EdgeInsets.zero,
          splashRadius: 1,
          iconSize: 15,
          icon: Icon(
            controller.text.isEmpty ? Icons.search : Icons.close,
            color: AppTheme.blueColor,
          ),
        ),
      ),
    );
  }
}
