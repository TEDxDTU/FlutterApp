import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tedx_dtu_app/global/widgets/labelled_widget.dart';

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
            child: Container(
              // color: Colors.red,
              child: TextFormField(
                inputFormatters: widget.inputFormatters,
                style: TextStyle(color: Colors.black, fontSize: 18),
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
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 7),
                  enabledBorder: UnderlineInputBorder(),
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
          ),
          // Icon(
          //   Icons.edit,
          //   size: 18,
          // ),
          if (!_isEditing)
            IconButton(
              visualDensity: VisualDensity.compact,
              color: Colors.grey,
              padding: EdgeInsets.zero,
              iconSize: 20,
              splashRadius: 20,
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
                Future.delayed(Duration(milliseconds: 10), () {
                  FocusScope.of(context).requestFocus(_focusNode);
                });
              },
            ),
        ],
      ),
    );
  }
}
