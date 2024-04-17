import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    this.onChanged,
    // this.validator,
    this.labelText,
    this.keyboardType,
    this.isPassword = false,
    this.validator,
  });

  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final String? Function(String?)? validator;
  final String? labelText;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword!;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.validator,
      initialValue: '',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              obscureText: _obscureText,
              keyboardType: widget.keyboardType,
              onChanged: (value) {
                if (widget.validator != null) {
                  // ignore: invalid_use_of_protected_member
                  state.setValue(value);
                  state.validate();
                }
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
              decoration: InputDecoration(
                labelText: widget.labelText,
                border: const OutlineInputBorder(),
                suffixIcon: widget.isPassword == false
                    ? null
                    : CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () =>
                            setState(() => _obscureText = !_obscureText),
                        child: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
              ),
            ),
            if (state.hasError)
              Text(
                state.errorText!,
                style: const TextStyle(color: Colors.redAccent),
              ),
          ],
        );
      },
    );
  }
}
