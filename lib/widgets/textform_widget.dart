import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    Key? key,
    required this.label,
    required this.hints,
    this.validator,
    this.onChanged,
    required this.controller,
    required this.node,
    required this.autovalidateMode,
    this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
  }) : super(key: key);

  final String label;
  final String hints;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final FocusNode node;
  final AutovalidateMode autovalidateMode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 10.0),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: onChanged,
          validator: validator,
          cursorColor: Colors.deepOrange,
          controller: controller,
          focusNode: node,
          autovalidateMode: autovalidateMode,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hints,
            isDense: true,
            filled: true,
            fillColor: const Color(0xFFF1F2F3),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            hintStyle: const TextStyle(
                color: Colors.black45,
                fontSize: 14.0,
                fontWeight: FontWeight.normal),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(color: Colors.red.shade200, width: 0.6)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(color: Colors.red.shade500, width: 0.6)),
          ),
        ),
      ],
    );
  }
}
