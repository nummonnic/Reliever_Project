import 'package:flutter/material.dart';

import '../../widget/detail_addVoice.dart';

class AddVoiceScreen extends StatelessWidget {
  static const routeName = '/add_voice-page';
  const AddVoiceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SpeechScreen(),
    );
  }
}