import 'package:abwab_learning_path/learning_path/exports.dart';
import 'package:flutter/material.dart';

class LearningPathScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Your Learning Path',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LearningPathWidget(),
    );
  }
}
