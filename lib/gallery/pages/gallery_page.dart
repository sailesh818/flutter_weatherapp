import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
//import 'package:image_input/image_input.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:url_launcher/url_launcher.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  File? _image;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        //widget.imgUrl = null;
      } else {
        print("No Image Printed");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getImageGallery();
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "You can upload your photos from here. Choose one device",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(children: [

              
            ],
          ),

          Row(
            children: [
              InkWell(
                onTap: () {
                  _launchInBrowser(Uri.parse("https://www.google.com/"));
                },
                child: Container(
                  color: Colors.blue,
                  padding: EdgeInsets.all(15),
                  child: Text("Google"),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Row(
            children: [
              InkWell(
                onTap: () {
                  getImageGallery();
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child:
                      _image != null
                          ? Image.file(_image!.absolute, fit: BoxFit.cover)
                          : Center(
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 30,
                            ),
                          ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              getImageGallery();
            },
            child: Container(child: Text("Upload")),
          ),
        ],
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
