import 'package:admin_app/constants/colors/App_color.dart';
import 'package:admin_app/providers/product_provider.dart';
import 'package:admin_app/screens/edit_product/edit_upload_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ItemCard extends StatelessWidget {
  ItemCard({required this.productId});

  final String productId;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrProduct = productProvider.productsById(productId);
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                EditOrUploadProductScreen(productModel: getCurrProduct),
          ),
        );
      },
      child: getCurrProduct == null
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200.w,
                decoration: BoxDecoration(
                  color: AppColor.ButtonColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                     const BoxShadow(
                      blurRadius: 1,
                      //offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Colors.blue[50],
                          ),
                          child: Center(
            child: Image.network(
              getCurrProduct.productImage ?? '',
              fit: BoxFit.cover,
              width: 200.w,
              height: 150.h,)
          ),
        
                        ),

                               
                        
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getCurrProduct.productTitle ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                        '${getCurrProduct.productPrice} EGP' ?? '',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.amber, size: 11.sp),
                              Icon(Icons.star,
                                  color: Colors.amber, size: 11.sp),
                              Icon(Icons.star,
                                  color: Colors.amber, size: 11.sp),
                              Icon(Icons.star,
                                  color: Colors.amber, size: 11.sp),
                              Icon(Icons.star_border,
                                  color: Colors.amber, size: 11.sp),
                              const SizedBox(width: 5),
                              Text(
                                '(3.0)',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                ),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    await productProvider
                                        .deleteProduct(productId);
                                    showSuccessAlertDialog(
                                        context: context,
                                        title: 'Success',
                                        message:
                                            'Product deleted successfully');
                                  },
                                  icon: const Icon(
                                    Icons.delete_rounded,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void showSuccessAlertDialog(
      {required BuildContext context,
      required String title,
      required String message}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
