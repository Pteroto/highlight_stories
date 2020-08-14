import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import '../urls.dart';
import '../common.dart';
import '../components/stories_buttons_widget.dart';

class CustomSwitchWidget extends StatelessWidget {
  CustomSwitchWidget({Key key, @required this.storyController})
      : super(key: key);

  final StoryController storyController;
  final List<int> stories = [];

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: Urls()
          .getVideos()
          .map((name) => new StoryItem.pageVideo(name,
              controller: storyController, imageFit: BoxFit.fitHeight))
          .toList(),
      onStoryShow: (s) {
        if(!stories.contains(s.hashCode)) stories.add(s.hashCode);
        print("Showing a story");
        StoriesButtons().setStyle(Urls().getLogo(stories.indexOf(s.hashCode)));
      },
      onComplete: () {
        Common.backToNative();
        print("Completed a cycle");
      },
      progressPosition: ProgressPosition.top,
      repeat: false,
      controller: storyController,
      onVerticalSwipeComplete: (direction) {
        switch (direction) {
          case Direction.down:
            Common.backToNative();
            break;
          default:
            break;
        }
      },
    );
  }
}
