import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoriesButtons extends StatefulWidget {
  @override
  _StoriesButtonsState createState() => _StoriesButtonsState();
}

class _StoriesButtonsState extends State<StoriesButtons> {
  @override
  Widget build(BuildContext context) {
    return new Stack(children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(),
              ),
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RaisedButton(
                        color: Colors.green,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Assista",
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white),
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 16.0,
                            ),
                          ],
                        )))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 16.0,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      "Saiba mais",
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 48.0, 8.0, 8.0),
          child: ClipOval(
            child: Material(
              color: Colors.black45,
              child: InkWell(
                splashColor: Colors.green, // inkwell color
                child: SizedBox(
                    width: 36,
                    height: 36,
                    child: Icon(Icons.close, color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
