import 'dart:math';

import 'package:do_later_mobile/models/note.dart';
import 'package:do_later_mobile/screen/edit.dart';
import 'package:do_later_mobile/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTodo extends StatelessWidget {
  final Note? data;
  final int? id;
  final DateTime dateModified;
  final String title;
  final String content;
  final dynamic onDelete;
  final dynamic onChanges;

  const CardTodo(
      {required this.dateModified,
      this.data,
      required this.title,
      required this.content,
      this.onDelete,
      this.onChanges,
      this.id,
      super.key});

  randomColorGenerator() {
    List<int> colorList = [
      OurColors.lightGrey,
      OurColors.lightPink,
      OurColors.palePink,
      OurColors.mintGreen,
    ];

    Random random = Random();
    int randomIndex = random.nextInt(colorList.length);

    return colorList[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: Color(randomColorGenerator()),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: () async {
          final res = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Edit(note: data)));

          if (res != null) {
            onChanges(res, id);
          }
        },
        trailing: IconButton(
          onPressed: () async {
            await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.grey.shade800,
                    icon: const Icon(Icons.info, color: Colors.grey),
                    title: const Text('Are you sure want to delete?',
                        style: TextStyle(color: Colors.white)),
                    content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                onDelete(id);
                                Navigator.pop(context, true);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              child: const Text(
                                'Yes',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              child: const Text(
                                'Cancel',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              )),
                        ]),
                  );
                });
          },
          icon: const Icon(Icons.delete),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
              '${DateFormat('EEE MMM d, yyyy H:mm a').format(dateModified)}',
              style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
        ),
        title: RichText(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                      text: content,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        height: 1.5,
                      ))
                ])),
      ),
    );
  }
}
