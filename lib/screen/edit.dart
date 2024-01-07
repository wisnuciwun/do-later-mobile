import 'package:do_later_mobile/widgets/default_floating_button.dart';
import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: DefaultFloatingButton(
          onPressed: () {
            print('');
            Navigator.pop(context, [title.text, content.text]);
          },
          icon: Icons.save,
        ),
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Edit todo',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      print('');
                    },
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800.withOpacity(.8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ))
              ]),
              Expanded(
                  child: ListView(
                children: [
                  TextField(
                    controller: title,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 30)),
                  ),
                  TextField(
                    controller: content,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Description',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 30)),
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
