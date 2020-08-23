import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'custom_container.dart';

class TextFieldWidget extends StatefulWidget {
  final String placeholder;
  final bool autofocus;
  final Function(String) onChanged;
  final TextInputType inputType;
  final String mask;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  final double fontSize;
  final Color background;
  final Color textColor;
  final Color placeholderColor;
  final Color cursorColor;
  final FontWeight fontWeight;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final FocusNode focusNode;
  final bool obscure;

  TextFieldWidget({
    this.placeholder,
    this.onChanged,
    this.inputType,
    this.mask,
    this.textCapitalization,
    this.autofocus,
    this.controller,
    this.fontSize = 16,
    this.background,
    this.textColor,
    this.fontWeight,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.placeholderColor,
    this.cursorColor,
    this.obscure,
  });

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: widget.background,
      radius: 4,
      child: TextField(
        obscureText: this.widget.obscure ?? false,
        controller: this.widget.controller,
        focusNode: this.widget.focusNode,
        autofocus:
            this.widget.autofocus != null ? this.widget.autofocus : false,
        textCapitalization: widget.textCapitalization != null
            ? widget.textCapitalization
            : TextCapitalization.none,
        keyboardAppearance: Brightness.dark,
        inputFormatters: this._getFormatters(),
        cursorColor: this.widget.cursorColor,
        onChanged: widget.onChanged,
        textAlign: TextAlign.start,
        textAlignVertical: this.widget.prefixIcon != null
            ? TextAlignVertical.center
            : TextAlignVertical.top,
        keyboardType: widget.inputType,
        maxLines: 1,
        decoration: InputDecoration(
          prefixIcon: this.widget.prefixIcon ?? null,
          suffixIcon: this.widget.suffixIcon ?? null,
          border: InputBorder.none,
          hasFloatingPlaceholder: false,
          // contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          hintText: widget.placeholder,
          hintStyle: TextStyle(
              color:
                  widget.placeholderColor ?? widget.textColor ?? Colors.white,
              fontStyle: FontStyle.normal),
        ),
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          color: widget.textColor ?? ColorsStyle.orange,
        ),
      ),
    );
  }

  List<MaskTextInputFormatter> _getFormatters() {
    if (this.widget.mask != null) {
      var maskFormatter = new MaskTextInputFormatter(
          mask: this.widget.mask, filter: {"#": RegExp(r'[0-9]')});
      return [maskFormatter];
    }
    return [];
  }
}
