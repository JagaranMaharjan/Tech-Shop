import 'package:card/provider/productsProvider.dart';
import 'package:card/screens/singleProductItemScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_recognition/speech_recognition.dart';

class VoiceDemo extends StatefulWidget {
  static const String routeName = "voiceDemo";
  @override
  _VoiceDemoState createState() => _VoiceDemoState();
}

class _VoiceDemoState extends State<VoiceDemo> {
  //declaration of speech recognition object
  SpeechRecognition _speechRecognition;
  //_isAvailable is a boolean variable which checks whether the application
  // is running in ios or android and checks whether the application lets us
  // to interactive or not
  bool _isAvailable = false;
  //_isListening  is boolean variable which detect whether the application is
  // listening to microphone or not
  bool _isListening = false;
  //in default both bool values are false
  String resultText = "";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler(
      (bool result) {
        setState(
          () {
            _isAvailable = result;
          },
        );
      },
    );

    _speechRecognition.setRecognitionStartedHandler(
      () {
        setState(
          () {
            _isListening = true;
          },
        );
      },
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) {
        setState(
          () {
            resultText = speech;
          },
        );
      },
    );

    _speechRecognition.setRecognitionCompleteHandler(
      () {
        setState(
          () {
            _isListening = false;
          },
        );
      },
    );

    _speechRecognition.activate().then(
      (result) {
        setState(
          () {
            _isAvailable = result;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _callMethods = Provider.of<ProductProvider>(context, listen: true);
    return AlertDialog(
      backgroundColor: Colors.white.withOpacity(1),
      content: Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        height: 200,
        width: 300,
        // color: Colors.blue[900].withOpacity(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Search Product By Voice",
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  elevation: 3,
                  child: Icon(Icons.cancel),
                  mini: true,
                  backgroundColor: Colors.deepOrangeAccent,
                  onPressed: () {
                    if (_isListening) {
                      _speechRecognition.cancel().then((result) {
                        setState(() {
                          resultText = "";
                          _isListening = result;
                          resultText = "";
                        });
                      });
                    }
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                FloatingActionButton(
                  elevation: 3,
                  child: Icon(Icons.mic),
                  onPressed: () {
                    if (_isAvailable && !_isListening) {
                      _speechRecognition.listen(locale: "en_US").then(
                            (result) => print('$result'),
                          );
                    }
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                FloatingActionButton(
                  elevation: 3,
                  child: Icon(Icons.stop),
                  backgroundColor: Colors.purple,
                  mini: true,
                  onPressed: () {
                    if (_isListening) {
                      _speechRecognition.stop().then(
                        (result) {
                          setState(
                            () {
                              _isListening = result;
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.cyan[100],
                borderRadius: BorderRadius.circular(6.0),
              ),
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(10),
              child: Text(resultText),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.red.withOpacity(0.7),
                    width: MediaQuery.of(context).size.width * 0.33,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(
                          Icons.cancel,
                          size: 22,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        Text(
                          "Cancel",
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white.withOpacity(0.9),
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    final getId = _callMethods.getProdId(resultText);
                    final call = _callMethods.productsValue();
                    print("my get id");
                    print(_callMethods.productId);
                    if (_callMethods.productId == "") {
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                              margin: EdgeInsets.all(0),
                              padding: EdgeInsets.all(0),
                              width: 200,
                              height: 150,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.info,
                                    size: 50,
                                    color: Colors.blueGrey,
                                  ),
                                  Container(
                                    height: 70,
                                    width: double.infinity,
                                    child: Text(
                                      "The products that you have "
                                      "searched was not found",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 18,
                                          letterSpacing: 1,
                                          color: Colors.blueGrey),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      color: Colors.red.withOpacity(0.7),
                                      width: 80,
                                      height: 30,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Icon(
                                            Icons.check_circle,
                                            size: 22,
                                            color:
                                                Colors.white.withOpacity(0.9),
                                          ),
                                          Text(
                                            "OK",
                                            //textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(
                          SingleProductItemScreen.routeName,
                          arguments: _callMethods.productId);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.orange.withOpacity(0.8),
                    width: MediaQuery.of(context).size.width * 0.34,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          size: 22,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        Text(
                          "Search",
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white.withOpacity(0.85),
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
