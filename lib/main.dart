import 'package:abwab_learning_path/utils/exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'learning_path/exports.dart';
import 'package:flutter/material.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LearningPathRepository _learningRepository = LearningPathRepository();

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LearningPathBloc(_learningRepository)),
        ],
        child: MaterialApp(
          title: 'Learning Path Abwaab',
          theme: appLightTheme,
          home: LearningPathScreen(),
        ));
  }
}
