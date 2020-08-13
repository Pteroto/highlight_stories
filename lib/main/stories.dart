import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highlight_stories/main/urls.dart';
import 'package:story_view/story_view.dart';
import 'buttons.dart';

class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
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
                case Direction.down:
                  Navigator.of(context).pop();
                  break;
                default:
                  break;
              }
            },
          ),
          StoriesButtons()
        ],
      ),
    );
  }
}
