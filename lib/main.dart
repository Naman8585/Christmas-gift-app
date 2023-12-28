import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Merry christmas",
      debugShowCheckedModeBanner: false,
      home: Myhomepage(),
    );
  }
}

class Myhomepage extends StatefulWidget {
  @override
  _MyhomepageState createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  double buttonX = 50.0;
  double buttonY = 50.0;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.red,
            title: Text(
              "Merry Christmas",
              style: GoogleFonts.abel(
                fontSize: 28,
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 50.0, left: 20.0),
                  child: Image.asset("assets/images/claus.gif")),
              Container(
                child: Text(
                  "Hey Friend!",
                  style: GoogleFonts.fahkwang(color: Colors.white, fontSize: 40.0),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Want your Christmas Present?",
                  style: GoogleFonts.fahkwang(color: Colors.white, fontSize: 20.0),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 100.0, top: 40.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 50.0, right: 50.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChristmasParagraphGenerator()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 40.0, right: 40.0),
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          child: Center(
                            child: Text(
                              "YES",
                              style: GoogleFonts.fahkwang(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class ChristmasParagraphGenerator extends StatefulWidget {
  @override
  _ChristmasParagraphGeneratorState createState() =>
      _ChristmasParagraphGeneratorState();
}

class _ChristmasParagraphGeneratorState
    extends State<ChristmasParagraphGenerator> {
  List<String> christmasSentences = [
    'Merry Christmas to you and your family!',
    'May your days be filled with joy and laughter.',
    'Wishing you a season of love and warmth.',
    'May the magic of Christmas fill your heart with happiness.',
    'Sending you my best wishes for a wonderful holiday season.',
    'May your home be filled with the joy of Christmas.',
    'Wishing you peace, love, and happiness this Christmas.',
    'May the spirit of Christmas bring you and your family hope and happiness.',
    'Sending warm wishes for a festive and joyful Christmas.',
    'May the joy and wonder of Christmas be with you always.'
  ];

  String generateRandomParagraph() {
    Random random = Random();
    List<String> selectedSentences = [];

    for (int i = 0; i < 10; i++) {
      int index = random.nextInt(christmasSentences.length);
      selectedSentences.add(christmasSentences[index]);
    }

    return selectedSentences.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 40.0),
              child: Center(
                child: Text(
                  "Merry Christmas !",
                  style: GoogleFonts.sacramento(
                      color: Colors.white, fontSize: 45.0),
                ),
              )),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Image.asset("assets/images/santa.gif"),
          ),
          Container(
            padding: EdgeInsets.only(top: 70.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  String randomParagraph = generateRandomParagraph();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "MERRY CHRISTMAS FRIEND! HERE'S YOUR GIFT",
                          style: GoogleFonts.fahkwang(color: Colors.red),
                        ),
                        content: Text(randomParagraph),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'THANKK YOUUUU',
                              style: GoogleFonts.fahkwang(color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 40.0, right: 40.0),
                    backgroundColor: Colors.red),
                child: Text(
                  'GIVE ME THE GIFT',
                  style: GoogleFonts.fahkwang(fontSize: 20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
