import 'package:biblio_bazar/ui/common_widgets/my_text.dart';
import 'package:biblio_bazar/utils/app_theme.dart';
import 'package:biblio_bazar/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? caption;
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscure;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final Function(String)? onChanged;
  final bool readOnly;
  final int maxLines;
  final String? initialValue;
  final bool isRequired;
  final int? maxLength;

  const MyTextFormField({
    Key? key,
    required this.controller,
    this.caption,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.readOnly = false,
    this.maxLines = 1,
    this.initialValue,
    this.isRequired = false,
    this.maxLength,
  }) : super(key: key);

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool _isObscure = false;

  // Toggles the password show status
  void _toggle() {
    setState(() => _isObscure = !_isObscure);
  }

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscure;
    widget.controller.text = widget.initialValue ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.caption == null
            ? kEmptyWidget
            : Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(widget.caption!, fontWeight: FontWeight.w500),
                    widget.isRequired
                        ? const MyText(
                            ' *',
                            fontWeight: FontWeight.w500,
                            color: AppTheme.redColor,
                          )
                        : kEmptyWidget,
                  ],
                ),
              ),
        TextFormField(
          obscureText: _isObscure,
          obscuringCharacter: '*',
          readOnly: widget.readOnly,
          controller: widget.controller,
          textAlignVertical: TextAlignVertical.center,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          validator: (s) {
            if (widget.isRequired && (s == null || s.isEmpty)) {
              return 'This field is required';
            }
            widget.validator?.call(s);
            return null;
          },
          onChanged: widget.obscure
              ? (s) {
                  if (s.length < 2) setState(() {});
                  widget.onChanged?.call(s);
                }
              : widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          keyboardType: widget.keyboardType,
          cursorColor: AppTheme.blackColor,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: widget.readOnly
                  ? AppTheme.darkGreyColor
                  : AppTheme.blackColor),
          decoration: InputDecoration(
            // isDense: true,
            counterText: '',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kDefaultRadius),
                borderSide: BorderSide(
                    color: widget.readOnly
                        ? AppTheme.lightPurpleColor
                        : AppTheme.blueColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kDefaultRadius),
                borderSide: const BorderSide(color: AppTheme.lightPurpleColor)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kDefaultRadius),
                borderSide: const BorderSide(color: AppTheme.redColor)),
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
            suffixIcon: widget.obscure && widget.controller.text.isNotEmpty
                ? IconButton(
                    onPressed: _toggle,
                    padding: EdgeInsets.zero,
                    splashRadius: 1,
                    iconSize: 15,
                    icon: FaIcon(
                      _isObscure
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: AppTheme.blueColor,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
