import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductImagePicker extends StatelessWidget {
  const ProductImagePicker({
    Key? key,
    required this.isEditing,
    required this.pickedImage,
    required this.productNetworkImage,
    required this.onPickImage,
    required this.onRemoveImage,
  }) : super(key: key);

  final bool isEditing;
  final XFile? pickedImage;
  final String? productNetworkImage;
  final VoidCallback onPickImage;
  final VoidCallback onRemoveImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: pickedImage != null
                ? Image.file(
                    File(pickedImage!.path),
                    fit: BoxFit.fill,
                  )
                : productNetworkImage != null
                    ? Image.network(
                        productNetworkImage!,
                        fit: BoxFit.fill,
                      )
                    : const Icon(
                        Icons.image_outlined,
                        size: 75,
                      ),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: onPickImage,
              icon: const Icon(Icons.add_photo_alternate),
              label: const Text('Choose Image'),
            ),
            if (isEditing && productNetworkImage != null)
              TextButton.icon(
                onPressed: onRemoveImage,
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text('Remove Image',
                    style: TextStyle(color: Colors.red)),
              ),
          ],
        ),
      ],
    );
  }
}
