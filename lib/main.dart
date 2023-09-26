// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quotesproject/widgets/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class BestQuotes {
  String title;
  String author;
  BestQuotes({required this.title, required this.author});
}

class _QuotesState extends State<Quotes> {
  List AllQuotes = [
    BestQuotes(author: "Ali Hassan", title: "رايق من نوعة فاخر 🔥"),
    BestQuotes(
        author: "Ali 7assan", title: "العقل السليم في البعد عن الحريم 😂"),
    BestQuotes(
        author: "Ali Elrayek",
        title: "كُتر التفكير فى الى ضااااع هيعمل لك فى دماغك صادااااع  😉 "),
    
    BestQuotes(
        author: "ELRAYEK",
        title: "فرح نفسك بنفسك ومتستناش حاجة حلوة من حد  ✋ "),
    
  ];
  delete(BestQuotes item) {
    setState(() {
      AllQuotes.remove(item);
    });
  }

  AddNewQuote() {
    setState(() {
      AllQuotes.add(
          BestQuotes(title: myController.text, author: myControlller.text));
    });
  }

  final myController = TextEditingController();
  final myControlller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: myController,
                          decoration:
                              InputDecoration(hintText: "Add New Quote"),
                          maxLength: 20,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        TextField(
                          controller: myControlller,
                          decoration: InputDecoration(hintText: "Add Author"),
                          maxLength: 20,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              AddNewQuote();
                            },
                            child: Text(
                              "ADD",
                              style: TextStyle(fontSize: 22),
                            ))
                      ],
                    ),
                  );
                },
                isScrollControlled: true);
          },
          backgroundColor: Colors.redAccent,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 50, 57, 121),
          title: Text(
            "Best Quotes Ever!!!",
            style: TextStyle(fontSize: 27),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: AllQuotes.map((item) => CardWidget(
                  item: item,
                  delete: delete,
                )).toList(),
          ),
        ));
  }
}
