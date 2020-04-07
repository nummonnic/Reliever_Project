import 'package:flutter/material.dart';

import '../screen/diary_screen.dart';
import '../widget/diaryB.dart';

class diary_item extends StatelessWidget {
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
