import 'package:flutter/material.dart';
import 'package:forms/mixins/form_mixins.dart';

class CustomTextField extends StatelessWidget with ValidationMixin {
      final String label;
      final String? hint;
      final IconData? icon;
      final bool? obscureText;
      final List<CallFunc>? customValidators;
      final void Function(String? text)? onSaved;
      final void Function(String text)? onChanged;

  CustomTextField({
    super.key, required this.label, this.hint, this.icon, this.customValidators, this.onSaved, this.onChanged, this.obscureText
    });
  
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
    Widget build(BuildContext context) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => 
          (customValidators != null && value != null && customValidators!.isNotEmpty) ? validators(customValidators, value) : null
        ,
        onSaved: onSaved,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
          prefixIcon: icon == null ? null : Icon(icon)
        ),
      );
    }
}

bool stringNotNullEmpty(String? text) {
  return (text == null || text.isEmpty) ? true : false;
}
