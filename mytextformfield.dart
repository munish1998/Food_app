import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final Color? focusBorderColor;
  final Color? focusColor;
  final Widget? suffixIcon;
  final String? labelText;

  CustomTextField({
    required this.controller,
    this.hintText,
    this.icon,
    this.onChanged,
    this.focusBorderColor,
    this.focusColor,
    this.suffixIcon,
    this.labelText,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.7,
      height: size.height * 0.1,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color:
              _isFocused ? widget.focusBorderColor ?? Colors.blue : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          Icon(widget.icon),
          SizedBox(width: 10.0),
          Expanded(
            child: TextField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                labelText: widget.labelText,
              ),
              focusNode: _focusNode,
            ),
          ),
          if (widget.suffixIcon != null) widget.suffixIcon!,
        ],
      ),
    );
  }
}
