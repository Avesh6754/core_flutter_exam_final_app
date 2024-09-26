import 'dart:ui';

import 'package:core_flutter_exam_final_app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class Viewscreen extends StatefulWidget {
  const Viewscreen({super.key});

  @override
  State<Viewscreen> createState() => _ViewscreenState();
}

class _ViewscreenState extends State<Viewscreen> {
GlobalKey imagekey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Veiw',style: TextStyle(color: Colors.white),),

      ),
      body: Center(
        child: Column(

          children: [
            RepaintBoundary(
              key: imagekey,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(fileimage!),

                  ),
                  Text('Name : ${txtname.text}',style: TextStyle(fontSize: 50),),
                  Text('STD: ${txtstd.text}',style: TextStyle(fontSize: 40),),
                  Text('GRID : ${txtgrid.text}',style: TextStyle(fontSize: 40),),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 10,),
          FloatingActionButton(onPressed: () async {
            RenderRepaintBoundary boundary =
            imagekey.currentContext!.findRenderObject() as RenderRepaintBoundary;
            final image= await boundary.toImage();
            final bytedata=await image.toByteData(format: ImageByteFormat.png);
            if(bytedata!=null)
              {
                final result= await   ImageGallerySaver.saveImage(bytedata.buffer.asUint8List());
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Photo Save !')));
              }

          },child: Icon(Icons.save),)
        ],
      ),
    );
  }
}
