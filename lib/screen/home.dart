import 'package:do_later_mobile/models/note.dart';
import 'package:do_later_mobile/widgets/card_todo.dart';
import 'package:flutter/material.dart';
import 'package:do_later_mobile/utils/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Note> filteredTodo = [];

  void onSearchModifiedText(String searchText) {
    filteredTodo = sampleNotes
        .where((element) =>
            element.content.toLowerCase().contains(searchText.toLowerCase()) ||
            element.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  void onDeleteNote(int id) {
    setState(() {
      Note note = filteredTodo[id];
      sampleNotes.remove(note);
      filteredTodo.removeAt(id);
    });
  }

  @override
  void initState() {
    filteredTodo = sampleNotes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('');
        },
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: Icon(Icons.add, size: 38),
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Do later',
                style: TextStyle(fontSize: 30, color: Colors.white)),
            // IconButton(
            //     padding: EdgeInsets.all(0),
            //     onPressed: () {
            //       print('');
            //     },
            //     icon: Container(
            //       width: 40,
            //       height: 40,
            //       decoration: BoxDecoration(
            //           color: Colors.grey.shade800.withOpacity(.8),
            //           borderRadius: BorderRadius.circular(10)),
            //       child: Icon(Icons.sort, color: Colors.white),
            //     ))
          ]),
          TextField(
              onChanged: onSearchModifiedText,
              style: TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  hintText: 'Search note...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  fillColor: Colors.grey.shade800,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.transparent)))),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.only(top: 30),
            itemCount: sampleNotes.length,
            itemBuilder: (context, index) {
              return CardTodo(
                  id: index,
                  onDelete: onDeleteNote,
                  title: '${sampleNotes[index].title} \n',
                  dateModified: sampleNotes[index].modifiedTime,
                  content: sampleNotes[index].content);
            },
          ))
        ]),
      ),
    );
  }
}
