import 'package:core_flutter_exam_final_app/utils/global.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'HomePage',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
                studentlist.length,
                (index) => Column(

                  children: [

                    GestureDetector(
                      onTap: () {
                        txtname.text = studentlist[index].name;
                        txtgrid.text = studentlist[index].grid;
                        txtstd.text = studentlist[index].std;
                        fileimage = studentlist[index].file;
                        Navigator.of(context).pushNamed('/view');
                      },
                      child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: FileImage(studentlist[index].file!),
                            ),
                            title: Text('${studentlist[index].name}'),
                            subtitle: Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${studentlist[index].std}'),
                                Text('${studentlist[index].grid}'),
                              ],
                            )),
                            trailing: Container(
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  IconButton(
                                      onPressed: () {
                                        txtname.text = studentlist[index].name;
                                        txtgrid.text = studentlist[index].grid;
                                        txtstd.text = studentlist[index].std;
                                        fileimage = studentlist[index].file;
                                        selectedindex=index;
                                        Navigator.of(context).pushNamed('/up');

                                      },
                                      icon: Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          studentlist.removeAt(index);
                                        });
                                      },
                                      icon: Icon(Icons.delete))
                                ],
                              ),
                            ),
                          ),
                    ),
                  ],
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          txtname = TextEditingController();
          txtgrid = TextEditingController();
          txtstd = TextEditingController();
          fileimage = null;
          Navigator.of(context).pushNamed('/data');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
