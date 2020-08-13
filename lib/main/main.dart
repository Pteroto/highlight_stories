import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child:
        new Stack(
          children: [
            StoryView(
              storyItems: [
                StoryItem.pageVideo(
                    "https://firebasestorage.googleapis.com/v0/b/highlightstories-37942.appspot.com/o/canal-brasil.mp4?alt=media&token=6b5c59a7-a4f4-4a0d-84c3-d849c1ad9a2d",
                    controller: storyController,
                    imageFit: BoxFit.fill),
                StoryItem.pageImage(
                    url:
                        "https://media.giphy.com/media/26ybxpCtI2tMGBtEA/source.gif",
                    controller: storyController),
                StoryItem.pageImage(
                  url:
                      "https://media.giphy.com/media/26ybxpCtI2tMGBtEA/source.gif",
                  controller: storyController,
                ),
                StoryItem.pageImage(
                  url:
                      "https://media.giphy.com/media/26ybxpCtI2tMGBtEA/source.gif",
                  controller: storyController,
                ),
              ],
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
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Text(
                    "fsafsaf",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "fsafsaf",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "fsafsaf",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
