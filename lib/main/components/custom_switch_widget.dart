import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import '../urls.dart';

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({
    Key key,
    @required this.storyController,
  }) : super(key: key);

  final StoryController storyController;

  @override
  Widget build(BuildContext context) {
    return StoryView(
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
    );
  }
}
