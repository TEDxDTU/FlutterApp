import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tedx_dtu_app/global/widgets/labelled_widget.dart';

/// Shows a text field designed specifically to enter passwords,
/// with a label above it, and an icon next to it that enables or disables
/// obscuring the text.Using this the user can hide or see their password
/// For documentation related to various customizations, see [TextField]
/// and [TextFormField]

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    TextInputType? keyboardType,
    required this.label,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.validator,
    this.textInputAction = TextInputAction.done,
  })  : keyboardType = keyboardType ?? TextInputType.text,
        super(key: key);

  /// The label to display above the text field
  final String label;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  bool _tapped = false;

  @override
  Widget build(BuildContext context) {
    return LabelledWidget(
      label: widget.label,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              onTap: () {
                if (!_tapped) {
                  setState(() {
                    _tapped = true;
                  });
                }
              },
              autovalidateMode: _tapped
                  ? AutovalidateMode.always
                  : AutovalidateMode.onUserInteraction,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              controller: widget.controller,
              onChanged: widget.onChanged,
              onFieldSubmitted: (val) {
                setState(() {});
                widget.onSubmitted?.call(val);
              },
              obscureText: _obscureText,
              keyboardType: widget.keyboardType,
              inputFormatters: widget.inputFormatters,
              validator: widget.validator,
              textInputAction: widget.textInputAction,
              decoration: InputDecoration(
                // isDense: true,
                contentPadding: EdgeInsets.zero,
                border: const UnderlineInputBorder(),
                enabledBorder: widget.controller.text.isEmpty
                    ? const UnderlineInputBorder()
                    : InputBorder.none,
                focusColor: Colors.red,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ],
      ),
    );
  }
}
