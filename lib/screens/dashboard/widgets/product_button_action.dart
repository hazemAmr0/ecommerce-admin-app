import 'package:flutter/material.dart';

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({
    Key? key,
    required this.isEditing,
    required this.clearForm,
    required this.onSubmit,
  }) : super(key: key);

  final bool isEditing;
  final VoidCallback clearForm;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: kBottomNavigationBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!isEditing)
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: clearForm,
              icon: const Icon(Icons.clear),
              label: const Text('Clear Form'),
            ),
          ElevatedButton.icon(
            onPressed: onSubmit,
            icon: const Icon(Icons.upload),
            label: Text(isEditing ? "Edit Product" : "Upload Product"),
          ),
        ],
      ),
    );
  }
}
