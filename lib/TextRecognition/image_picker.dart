import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';


class UserImagePicker extends StatefulWidget {
   UserImagePicker(
      this.imagePickFn,
);

  final void Function(File pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}
class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage = File("assets/text_recognition/text.jpg");
  ImagePicker picker = ImagePicker();

  void _pickImage(ImageSource imageSource) async {
    final pickedImageFile = await picker.pickImage(
      source: imageSource,
    );

    setState(() {
      _pickedImage = File(pickedImageFile!.path);
    });
    widget.imagePickFn(File(pickedImageFile!.path));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.orangeAccent.withOpacity(0.3),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: _pickedImage != null
                  ? Image(
                image: FileImage(_pickedImage),
              )
                  : const Center(
                child: Text("Please Add Image"),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton.icon(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text(
                      "Complete your action using..",
                    ),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Cancel",
                        ),
                      ),
                    ],
                    content: Container(
                      height: 120,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.camera),
                            title: const Text(
                              "Camera",
                            ),
                            onTap: () {
                              _pickImage(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                          ),
                          const Divider(
                            height: 1,
                            color: Colors.black,
                          ),
                          ListTile(
                            leading: const Icon(Icons.image),
                            title: const Text(
                              "Gallery",
                            ),
                            onTap: () {
                              _pickImage(ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          icon: const Icon(Icons.add),
          label: const Text(
            'Add Image',
          ),
        )
      ],
    );
  }
}