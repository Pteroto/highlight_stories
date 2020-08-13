import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highlight_stories/main/urls.dart';
import 'package:story_view/story_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Highlight Stories',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Home());
  }
}

class Home extends StatelessWidget {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Highlight Stories"),
      ),
      body: Container(
          margin: EdgeInsets.all(
            8,
          ),
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MoreStories()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(8), top: Radius.circular(8))),
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "View stories",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class MoreStories extends StatefulWidget {
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: [
          StoryView(
            storyItems: Urls()
                .getVideos()
                .map((name) => new StoryItem.pageVideo(name,
                    controller: storyController, imageFit: BoxFit.fitHeight))
                .toList(),
            onStoryShow: (s) {
              print("Showing a story");
            },
            onComplete: () {
              Navigator.of(context).pop();
              print("Completed a cycle");
            },
            progressPosition: ProgressPosition.top,
            repeat: false,
            controller: storyController,
            onVerticalSwipeComplete: (direction) {
              switch (direction) {
                case Direction.up:
                  break;
                case Direction.down:
                  Navigator.of(context).pop();
                  break;
              }
            },
          ),
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
          )
        ],
      ),
    );
  }
}
