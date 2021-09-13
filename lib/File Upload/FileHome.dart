import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:many_apps/File%20Upload/serivces.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileHome extends StatefulWidget {
  @override
  _FileHomeState createState() => _FileHomeState();
}

class _FileHomeState extends State<FileHome> {
  File? file;
  UploadTask? task;
  String filename = "No File is selected";
  selectfile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) {
      return;
    } else {
      final path = result.files.single.path;
      setState(() {
        file = File(path);
        filename = basename(file!.path);
      });
    }
  }

  uploadfile() {
    if (file == null) {
      return;
    }
    final destination = "files/$filename";
    task = MYFirebaseStorage.uploadFile(destination, file!);
    setState(() {});
  }

  UploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percet = (progress * 100).toStringAsFixed(2);
            return Text("$percet %");
          } else {
            return Container();
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Uploader"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  selectfile();
                },
                child: Text("select file")),
            Text(filename),
            ElevatedButton(
                onPressed: () {
                  uploadfile();
                },
                child: Text("upload file")),
            if (task != null) UploadStatus(task!) else Container()
          ],
        ),
      ),
    );
  }
}
