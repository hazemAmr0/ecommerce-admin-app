import 'dart:io';

import 'package:admin_app/constants/Category_List.dart';
import 'package:admin_app/constants/choose_image_dialog.dart';
import 'package:admin_app/core/widgets/loading_manager.dart';
import 'package:admin_app/models/product_model.dart';
import 'package:admin_app/screens/dashboard/widgets/category_drop_down.dart';
import 'package:admin_app/screens/dashboard/widgets/product_Text_form.dart';
import 'package:admin_app/screens/dashboard/widgets/product_button_action.dart';
import 'package:admin_app/screens/dashboard/widgets/product_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class EditOrUploadProductScreen extends StatefulWidget {
  const EditOrUploadProductScreen({super.key, this.productModel});
  final ProductModel? productModel;

  @override
  State<EditOrUploadProductScreen> createState() =>
      _EditOrUploadProductScreenState();
}

class _EditOrUploadProductScreenState extends State<EditOrUploadProductScreen> {
  final _formKey = GlobalKey<FormState>();
  XFile? _pickedImage;
  bool isEditing = false;
  bool isLoading = false;
  String? productNetworkImage;

  late TextEditingController _titleController,
      _priceController,
      _descriptionController,
      _quantityController;
  String? _categoryValue;

  @override
  void initState() {
    if (widget.productModel != null) {
      isEditing = true;
      productNetworkImage = widget.productModel!.productImage;
      _categoryValue = widget.productModel!.productCategory;
    }
    _titleController =
        TextEditingController(text: widget.productModel?.productTitle);
    _priceController =
        TextEditingController(text: widget.productModel?.productPrice);
    _descriptionController =
        TextEditingController(text: widget.productModel?.productDescription);
    _quantityController =
        TextEditingController(text: widget.productModel?.productQuantity);

    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void clearForm() {
    _titleController.clear();
    _priceController.clear();
    _descriptionController.clear();
    _quantityController.clear();
    removePickedImage();
  }

  void removePickedImage() {
    setState(() {
      _pickedImage = null;
      productNetworkImage = null;
    });
  }

  Future<void> _uploadProduct(BuildContext context) async {
    if (!validateInputs(context)) return;

    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    try {
      final productId = Uuid().v4();
      setState(() {
        isLoading = true;
      });
      final productImage = await uploadProductImage(productId);

      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .set({
        'productId': productId,
        'productTitle': _titleController.text.trim(),
        'productPrice': _priceController.text.trim(),
        'productDescription': _descriptionController.text.trim(),
        'productCategory': _categoryValue,
        'productQuantity': _quantityController.text.trim(),
        'productImage': productImage,
        'Timestamp': DateTime.now(),
      });
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, 'Product added successfully', Colors.green);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, 'Failed to add product: $e', Colors.red);
    }
  }

  bool validateInputs(BuildContext context) {
    if (_categoryValue == null) {
      showSnackBar(context, "Please pick up a category", Colors.red);
      return false;
    }

    if (_pickedImage == null) {
      showSnackBar(context, "Please pick up an image", Colors.red);
      return false;
    }

    return true;
  }

  Future<String> uploadProductImage(String productId) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    final Reference ref =
        storage.ref().child('ProductsImages').child('$productId.jpg');
    await ref.putFile(File(_pickedImage!.path));
    return await ref.getDownloadURL();
  }

  void showSnackBar(
      BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(message),
      ),
    );
  }

  Future<void> _editProduct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_pickedImage == null && productNetworkImage == null) {
      showSnackBar(context, "Please pick up an image", Colors.red);
      return;
    }
    if (_categoryValue == null) {
      showSnackBar(context, "Please pick up a category", Colors.red);
      return;
    }
    if (isValid) {
      _formKey.currentState!.save();
      try {
        setState(() {
          isLoading = true;
        });
        if (_pickedImage != null) {
          final ref = FirebaseStorage.instance
              .ref()
              .child("productsImages")
              .child('${_titleController.text.trim()}.jpg');
          await ref.putFile(File(_pickedImage!.path));
          productNetworkImage = await ref.getDownloadURL();
        }

        await FirebaseFirestore.instance
            .collection("products")
            .doc(widget.productModel!.productId)
            .update({
          'productId': widget.productModel!.productId,
          'productTitle': _titleController.text.trim(),
          'productPrice': _priceController.text.trim(),
          'productDescription': _descriptionController.text.trim(),
          'productCategory': _categoryValue,
          'productQuantity': _quantityController.text.trim(),
          'productImage': _pickedImage != null
              ? productNetworkImage
              : widget.productModel!.productImage,
          'Timestamp': DateTime.now(),
        });

        showSnackBar(context, "Product edited successfully", Colors.green);
      } on FirebaseException catch (error) {
        showSnackBar(context, "An error has been occurred $error", Colors.red);
      } catch (error) {
        showSnackBar(context, "An error has been occurred $error", Colors.red);
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void localImagePicker() {
    final ImagePicker picker = ImagePicker();
    showChooseImageDialog(
      context: context,
      onCameraTap: () async {
        _pickedImage = await picker.pickImage(source: ImageSource.camera);
        setState(() {
          productNetworkImage = null;
        });
      },
      onGalleryTap: () async {
        _pickedImage = await picker.pickImage(source: ImageSource.gallery);
        setState(() {
          productNetworkImage = null;
        });
      },
      onRemoveTap: () {
        setState(() {
          _pickedImage = null;
          productNetworkImage = null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoadingManager(
      isLoading: isLoading,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomSheet: BottomActionBar(
            isEditing: isEditing,
            clearForm: clearForm,
            onSubmit: () {
              if (isEditing) {
                _editProduct();
              } else {
                _uploadProduct(context);
              }
            },
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text(isEditing ? "Edit Product" : "Upload Product"),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ProductImagePicker(
                    isEditing: isEditing,
                    pickedImage: _pickedImage,
                    productNetworkImage: productNetworkImage,
                    onPickImage: localImagePicker,
                    onRemoveImage: removePickedImage,
                  ),
                  const SizedBox(height: 25),
                  CategoryDropdown(
                    categoryValue: _categoryValue,
                    onChanged: (String? value) {
                      setState(() {
                        _categoryValue = value;
                      });
                    },
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: ProductForm(
                      formKey: _formKey,
                      titleController: _titleController,
                      priceController: _priceController,
                      quantityController: _quantityController,
                      descriptionController: _descriptionController,
                    ),
                  ),
                  const SizedBox(height: kBottomNavigationBarHeight + 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}








