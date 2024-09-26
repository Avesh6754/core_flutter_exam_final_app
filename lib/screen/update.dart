
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/global.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: GestureDetector(onTap: () {
          Navigator.of(context).pop();
        },child: Icon(Icons.arrow_back_rounded,color: Colors.white,)),
        title: Text(
          'Update Page',
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
                      backgroundImage: (fileimage != null)
                          ? FileImage(fileimage!)
                          : null,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton.filled(onPressed: () async {
                          XFile? imagefile=await imagePicker.pickImage(source: ImageSource.camera);
                          setState(() {
                            fileimage=File(imagefile!.path);
                          });
                        }, icon: Icon(Icons.camera_alt)),
                        SizedBox(width: 30,),
                        IconButton.filled(onPressed: () async {
                          XFile? imagefile=await imagePicker.pickImage(source: ImageSource.gallery);
                          setState(() {
                            fileimage=File(imagefile!.path);
                          });
                        }, icon: Icon(Icons.photo)),

                      ],
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      validator: (value) {
                        return (value!.isEmpty) ? "Enter the mandatory details" : null;
                      },
                      controller: txtname,
                      decoration: InputDecoration(
                          label: Text('Name'),
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      validator: (value) {
                        return (value!.isEmpty) ? "Enter the mandatory details" : null;
                      },
                      controller: txtstd,
                      decoration: InputDecoration(
                          label: Text('STD'),
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)
                          )
                      ),
                    ),

                    SizedBox(height: 10,),
                    TextFormField(
                      validator: (value) {
                        return (value!.isEmpty) ? "Enter the mandatory details" : null;
                      },
                      controller: txtgrid,
                      decoration: InputDecoration(
                          label: Text('Grid'),
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)
                          )
                      ),
                    ),

                  ],
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              studentlist[selectedindex].name=txtname.text;
              studentlist[selectedindex].grid=txtgrid.text;
              studentlist[selectedindex].std=txtstd.text;
              studentlist[selectedindex].file=fileimage;
              Navigator.of(context).pushNamed('/');
            }, child: Text('Update'))
          ],
        ),
      ),
    );
  }
}
