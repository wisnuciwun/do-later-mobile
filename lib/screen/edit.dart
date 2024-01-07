import 'package:do_later_mobile/models/note.dart';
import 'package:do_later_mobile/screen/home.dart';
import 'package:do_later_mobile/widgets/default_floating_button.dart';
import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  final Note? note;
  const Edit({this.note, super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState() {
    if (widget.note != null) {
      title.text = widget.note!.title;
      content.text = widget.note!.content;
    }
    super.initState();
  }

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
                IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const Home()));
                    },
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800.withOpacity(.8),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    )),
              ]),
              Expanded(
                  child: ListView(
                children: [
                  TextField(
                    controller: title,
                    style: const TextStyle(color: Colors.white, fontSize: 34),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Fill todo title',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 34)),
                  ),
                  TextField(
                    controller: content,
                    maxLines: null,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Fill descriptions',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 16)),
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
