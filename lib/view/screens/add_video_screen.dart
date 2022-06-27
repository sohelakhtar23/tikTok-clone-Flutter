import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/view/screens/confirm_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>  ConfirmScreen(
            videoPath: video.path,
            videoFile: File(video.path),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => showDialogOptions(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Add Video',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  showDialogOptions(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: () => pickVideo(ImageSource.gallery, context),
              child: Row(
                children: const [
                  Icon(Icons.image),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text('Gallery', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => pickVideo(ImageSource.camera, context),
              child: Row(
                children: const [
                  Icon(Icons.camera_alt),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text('Camera', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Row(
                children: const [
                  Icon(Icons.cancel),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text('Cancel', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
