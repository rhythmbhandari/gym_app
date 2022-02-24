import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/app/config/theme_colors.dart';

class EmailInputField extends StatefulWidget {
  final FocusNode _focusNode;
  final String _hintText;
  final String _labelText;
  final Function _onTap;
  final Function _onSubmit;
  final bool _enabled;
  final IconData _icon;
  final TextInputType _textInputType;
  final Function _onChanged;
  final String _errorText;
  final TextEditingController _controller;
  final Color _inputColor;
  final double _radius;
  final double _focusedRadius;

  EmailInputField({
    @required FocusNode focusNode,
    @required String hintText,
    @required String labelText,
    bool enabled,
    Function onTap,
    @required TextInputType textInputType,
    Color inputColor,
    double focusedRadius,
    Function onSubmit,
    String errorText,
    @required TextEditingController controller,
    @required Function onChanged,
    IconData icon,
    double radius,
  })
      : _focusNode = focusNode,
        _hintText = hintText,
        _labelText = labelText,
        _icon = icon,
        _focusedRadius = focusedRadius,
        _onSubmit = onSubmit,
        _inputColor = inputColor,
        _onChanged = onChanged,
        _controller = controller,
        _radius = radius,
        _onTap = onTap,
        _enabled = enabled,
        _errorText = errorText,
        _textInputType = textInputType;

  @override
  _EmailInputFieldState createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  @override
  Widget build(BuildContext context) {
    widget._focusNode.addListener(() {
      setState(() {});
    });
    return TextField(
        keyboardType: widget._textInputType,
        focusNode: widget._focusNode,
        autofocus: false,
        controller: widget._controller,
        onChanged: widget._onChanged,
        onSubmitted: widget._onSubmit,
        cursorColor: primaryColor,
        onTap: widget._onTap == null? (){}: widget._onTap,
        style: TextStyle(
            color: Colors.grey[700],
            fontFamily: 'Poppins',
            fontSize: 16),
        decoration: InputDecoration(
          //
          filled: true,
          fillColor: widget._inputColor,
          // errorText: widget._errorText,
          labelStyle: Get.textTheme.headline5.copyWith(
            color: widget._focusNode.hasFocus && widget._errorText != null
                ? Colors.red
                : widget._focusNode.hasFocus //widget._errorText == null
                ? primaryColor
                : widget._errorText == null
                ? Colors.grey
                : Colors.red,
          ),
          enabled: widget._enabled == null ? true : widget._enabled,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          // hintText: widget._hintText,
          hintStyle: Get.textTheme.headline5.copyWith(
              color: Colors.grey[500],
              fontFamily: 'Poppins',
              fontSize: 18),
          // suffixIcon: Icon(
          //   widget._icon,
          //   color: widget._focusNode.hasFocus && widget._errorText != null
          //       ? Colors.red
          //       : widget._focusNode.hasFocus //widget._errorText == null
          //           ? primaryTextColor
          //           : widget._errorText == null
          //               ? Colors.grey
          //               : Colors.red,
          // ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget._focusedRadius),
            borderSide: BorderSide(color: primaryColor, width: 1.2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget._radius),
            borderSide: BorderSide(
              color: widget._inputColor,
              width: 1.2,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: widget._inputColor),
            borderRadius: BorderRadius.circular(widget._radius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget._inputColor),
            borderRadius: BorderRadius.circular(widget._radius),
          ),
        ));
  }
}
