import 'package:flutter/material.dart';

void showChooseImageDialog({required BuildContext context,required Function onCameraTap,required Function onGalleryTap,required Function onRemoveTap}) {
  showDialog(
    context: context,
    

    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Choose Option"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library,color: Colors.amber,),
                title: Text('Gallery'),
                onTap: () {
                 onGalleryTap();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera,color: Colors.blue),
                title: Text('Camera'),
                onTap: () {
                 
                  onCameraTap();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.remove_circle,color: Colors.red ,),
                title: Text('Remove'),
                onTap: () {
                  onRemoveTap();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
