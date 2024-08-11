import 'package:flutter/material.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({
    Key? key,
    required this.formKey,
    required this.titleController,
    required this.priceController,
    required this.quantityController,
    required this.descriptionController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController quantityController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  //  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Product Title"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter a product title.";
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: priceController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  //  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Price"),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter a price.";
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: quantityController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  //  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Quantity"),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter a quantity.";
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: descriptionController,
            maxLines: 3,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  //  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Description"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter a description.";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
