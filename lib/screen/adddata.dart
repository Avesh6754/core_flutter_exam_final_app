import 'dart:ffi';
import 'dart:io';

import 'package:core_flutter_exam_final_app/model/model.dart';
import 'package:core_flutter_exam_final_app/screen/home.dart';
import 'package:core_flutter_exam_final_app/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Adddata extends StatefulWidget {
  const Adddata({super.key});

  @override
  State<Adddata> createState() => _AdddataState();
}

class _AdddataState extends State<Adddata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            )),
        title: Text(
          'Detail Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: fromkey,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          (fileimage != null) ? FileImage(fileimage!) : null,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton.filled(
                            onPressed: () async {
                              XFile? imagefile = await imagePicker.pickImage(
                                  source: ImageSource.camera);
                              setState(() {
                                fileimage = File(imagefile!.path);
                              });
                            },
                            icon: Icon(Icons.camera_alt)),
                        SizedBox(
                          width: 30,
                        ),
                        IconButton.filled(
                            onPressed: () async {
                              XFile? imagefile = await imagePicker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                fileimage = File(imagefile!.path);
                              });
                            },
                            icon: Icon(Icons.photo)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        return (value!.isEmpty)
                            ? "Enter the mandatory details"
                            : null;
                      },
                      controller: txtname,
                      decoration: InputDecoration(
                          label: Text('Name'),
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        return (value!.isEmpty)
                            ? "Enter the mandatory details"
                            : null;
                      },
                      controller: txtstd,
                      decoration: InputDecoration(
                          label: Text('STD'),
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        return (value!.isEmpty)
                            ? "Enter the mandatory details"
                            : null;
                      },
                      controller: txtgrid,
                      decoration: InputDecoration(
                          label: Text('Grid'),
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red))),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (fromkey.currentState!.validate() && fileimage != null) {
                   Navigator.of(context).pushNamed('/');
                    studentlist.add(StudentModel(
                        name: txtname.text,
                        file: fileimage,
                        grid: txtgrid.text,
                        std: txtstd.text));
                  }
                  if (fileimage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Photo Must Required !')));
                  }
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
