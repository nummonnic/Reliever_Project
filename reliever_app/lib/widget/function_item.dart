import 'package:flutter/material.dart';

import './diaryB.dart';
import './resultB.dart';
import '../screen/diary_screen.dart';
import '../screen/result_screen.dart';

class diary_Item extends StatelessWidget {
  void selectDiary(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      DiaryScreen.routeDiary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectDiary(context),
      child: GoToDiary(),
    );
  }
}

class result_item extends StatelessWidget {
  void selectResult(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      ResultScreen.routeResult,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectResult(context),
      child: GoToResult(),
    );
  }
}
