import 'package:flutter/material.dart';

import './diaryB.dart';
import './resultB.dart';
import '../screen/diary_screen.dart';
import '../screen/result_screen.dart';

class diary_Item extends StatelessWidget {
  const diary_Item({Key key}) : super(key: key);

  void selectDiary(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return DiaryScreen();
        },
      ),
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
  const result_item({Key key}) : super(key: key);

  void selectResult(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return ResultScreen();
        },
      ),
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
