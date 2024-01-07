import 'dart:math';

import 'package:do_later_mobile/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTodo extends StatelessWidget {
  final DateTime dateModified;
  final String title;
  final String content;

  const CardTodo(
      {required this.dateModified,
      required this.title,
      required this.content,
      super.key});

  randomColorGenerator() {
    List<int> colorList = [
      OurColors.lightBlue,
      OurColors.paleGreen,
      OurColors.paleYellow,
      OurColors.beige,
      OurColors.lightPink,
      OurColors.lightGrey,
      OurColors.palePink,
      OurColors.paleBlue,
      OurColors.mintGreen,
      OurColors.paleOrange,
    ];

    Random random = Random();
    int randomIndex = random.nextInt(colorList.length);

    return colorList[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      color: randomColorGenerator(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        trailing: IconButton(
          onPressed: () {},
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
