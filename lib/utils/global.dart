import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../model/model.dart';

List studentlist=[

];

TextEditingController txtname=TextEditingController();
TextEditingController txtgrid=TextEditingController();
TextEditingController txtstd=TextEditingController();

File? fileimage;

GlobalKey<FormState>fromkey = GlobalKey<FormState>();

ImagePicker imagePicker=ImagePicker();
var selectedindex=0;