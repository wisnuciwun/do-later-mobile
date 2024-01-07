import 'package:do_later_mobile/models/note.dart';
import 'package:do_later_mobile/screen/edit.dart';
import 'package:do_later_mobile/widgets/card_todo.dart';
import 'package:do_later_mobile/widgets/default_floating_button.dart';
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
    setState(() {
      filteredTodo = sampleNotes
          .where((element) =>
              element.content
                  .toLowerCase()
                  .contains(searchText.toLowerCase()) ||
              element.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void onDeleteNote(int id) {
    setState(() {
      filteredTodo.removeAt(id);
    });
  }

  void onChangeNotes(res, id) {
    int originalId = sampleNotes.indexOf(filteredTodo[id]);

    sampleNotes[originalId] = Note(
        id: sampleNotes[originalId].id,
        title: res[0],
        content: res[1],
        modifiedTime: DateTime.now());
    filteredTodo[id] = Note(
        id: sampleNotes[id].id,
        title: res[0],
        content: res[1],
        modifiedTime: DateTime.now());
    setState(() {});
  }

  void onAddNotes(res) {
    setState(() {
      sampleNotes.add(Note(
          id: sampleNotes.length,
          title: res[0],
          content: res[1],
          modifiedTime: DateTime.now()));
      filteredTodo = sampleNotes;
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
      floatingActionButton: DefaultFloatingButton(
        onPressed: () async {
          final res = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const Edit()));

          if (res != null) {
            onAddNotes(res);
          }
        },
        icon: Icons.add,
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(children: [
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Do later',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        color: Colors.white)),
              ]),
          const SizedBox(
            height: 15,
          ),
          TextField(
              onChanged: onSearchModifiedText,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  hintText: 'Search note...',
                  hintStyle: const TextStyle(color: Colors.grey),
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
            padding: const EdgeInsets.only(top: 30),
            itemCount: filteredTodo.length,
            itemBuilder: (context, index) {
              return CardTodo(
                  data: filteredTodo[index],
                  id: index,
                  onDelete: onDeleteNote,
                  title: '${filteredTodo[index].title} \n',
                  dateModified: filteredTodo[index].modifiedTime,
                  onChanges: (res, id) => onChangeNotes(res, id),
                  content: filteredTodo[index].content);
            },
          ))
        ]),
      ),
    );
  }
}
