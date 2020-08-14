import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highlight_stories/main/components/custom_switch_widget.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';

import 'components/stories_buttons_widget.dart';


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
          CustomSwitchWidget(storyController: storyController),
          StoriesButtons()
        ],
      ),
    );
  }
}
