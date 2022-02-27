import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tedx_dtu_app/global/widgets/labelled_widget.dart';

/// Shows a text field with a label above it, and an edit icon next to it.
/// When the edit icon is pressed the field is enabled and focused. When the
/// done button is pressed, the keyboard disappears and the edit icon appears
/// again. For documentation related to various customizations, see [TextField]
/// and [TextFormField]
class EditableTextField extends StatefulWidget {
  const EditableTextField({
    Key? key,
    TextInputType? keyboardType,
    required this.label,
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.validator,
    this.textInputAction = TextInputAction.done,
  })  : keyboardType = keyboardType ?? TextInputType.text,
        super(key: key);

  /// The label to display above the text field
  final String label;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;

  @override
  _EditableTextFieldState createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  bool _isEditing = false;
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return LabelledWidget(
      label: widget.label,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              inputFormatters: widget.inputFormatters,
              style: const TextStyle(color: Colors.black, fontSize: 18),
              focusNode: _focusNode,
              enabled: _isEditing,
              validator: widget.validator,
              initialValue: widget.initialValue,
              keyboardType: widget.keyboardType,
              onChanged: widget.onChanged,
              onFieldSubmitted: (val) {
                setState(() {
                  _isEditing = false;
                });
                widget.onSubmitted?.call(val);
              },
              decoration: InputDecoration(
                errorStyle: TextStyle(
                  color: CupertinoColors.destructiveRed,
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 7),
                enabledBorder: const UnderlineInputBorder(),
                disabledBorder: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                focusColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
          if (!_isEditing)
            IconButton(
              visualDensity: VisualDensity.compact,
              color: Colors.grey,
              padding: EdgeInsets.zero,
              iconSize: 20,
              splashRadius: 20,
              icon: const Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
                // Delayed to allow the field to render before focusing
                // Otherwise Flutter will attempt to focus the field before it
                // is even enabled, resulting in nothing happening.
                // Zero duration delay did not work, so 10 was chosen.
                Future.delayed(const Duration(milliseconds: 10), () {
                  FocusScope.of(context).requestFocus(_focusNode);
                });
              },
            ),
        ],
      ),
    );
  }
}
