import 'package:flutter/material.dart';

import '../widget/resultB.dart';
import '../screen/result_screen.dart';

class result_item extends StatelessWidget {
  void selectResult(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      ResultScreen.routeName,
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
