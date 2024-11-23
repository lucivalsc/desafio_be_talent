import 'package:flutter/material.dart';

class FieldTextWidget extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback onClickClear;
  const FieldTextWidget({
    super.key,
    required this.label,
    this.controller,
    this.onChanged,
    required this.onClickClear,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        hintText: label,
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        suffixIcon: controller != null && controller!.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  controller!.text = '';
                  onClickClear();
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
              )
            : null,
      ),
    );
  }
}
