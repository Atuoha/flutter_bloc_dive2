import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import '../../../../constants/enums/fields.dart';

class KTextField extends StatefulWidget {
  KTextField({
    Key? key,
    this.isObscured = false,
    required this.controller,
    required this.hintText,
    required this.label,
    required this.field,
    this.password = '',
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final String label;
  final Field field;
  bool? isObscured;
  String? password;



  @override
  State<KTextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<KTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.field == Field.phone
          ? TextInputType.phone
          : TextInputType.text,
      textInputAction: widget.field == Field.password
          ? TextInputAction.done
          : TextInputAction.next,
      controller: widget.controller,
      obscureText: widget.field == Field.password ? widget.isObscured! : false,
      validator: (value) {
        if (widget.field == Field.fullname) {
          if (value!.isEmpty || value.length < 6) {
            return '${widget.label} needs to be valid';
          }
        } else if (widget.field == Field.phone) {
          if (value!.isEmpty || value.length < 11) {
            return '${widget.label} needs to be valid';
          }
        } else if (widget.field == Field.password2) {
          if (value!.isEmpty) {
            return '${widget.label} can not be empty';
          }

          if (value != widget.password!) {
            return 'Password mismatch. Try again!';
          }

          if (value.length < 8) {
            return '${widget.label} needs to be valid';
          }
        } else if (widget.field == Field.email) {
          if (value!.isEmpty) {
            return '${widget.label} can not be empty';
          }
          if (!isEmail(value.trim())) {
            return '${widget.label} needs to be valid';
          }
        } else {
          if (value!.isEmpty) {
            return '${widget.label} can not be empty';
          }

          if (value.length < 8) {
            return '${widget.label} needs to be valid';
          }
        }

        return null;
      },
      onSaved: (value) {
        widget.controller.text = value!;
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        label: Text(widget.label),
        suffix: widget.field == Field.password
            ? widget.controller.text.isNotEmpty
                ? GestureDetector(
                    onTap: () => setState(() {
                      widget.isObscured = !widget.isObscured!;
                    }),
                    child: Icon(
                      widget.isObscured!
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  )
                : const SizedBox.shrink()
            : const SizedBox.shrink(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
