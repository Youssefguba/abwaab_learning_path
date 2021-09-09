import 'package:abwab_learning_path/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../exports.dart';

class LearningPathWidget extends StatefulWidget {
  const LearningPathWidget({Key? key}) : super(key: key);

  @override
  _LearningPathWidgetState createState() => _LearningPathWidgetState();
}

class _LearningPathWidgetState extends State<LearningPathWidget> {

  @override
  void initState() {
    // call learning path event to get list of learning path.
    context.read<LearningPathBloc>().add(GetLearningPathEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearningPathBloc, LearningPathState>(
      builder: (context, state) {
        /// Success state
        if (state is GetLearningPathStateDone) {
          final listOfLearningPath = state.listOfPaths;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: listOfLearningPath.length,
            itemBuilder: (_, index) {
              return Container(
                margin: index.isOdd
                    ? EdgeInsets.only(left: 60)
                    : EdgeInsets.only(right: 55),
                child: PathCardWidget(
                  index: index,
                  model: listOfLearningPath[index],
                ),
              );
            },
          );
        }

        /// Loading State
        if (state is LoadingState) {
          return LoadingWidget();
        }

        /// When list data is empty
        if (state is DataEmptyState) {
          return Center(
            child: Text('Oh sorry, There is not data yet, try again later!'),
          );
        }

        /// When Failed State
        if (state is FailedState) {
          return Center(
            child: Text('There is a problem, try again later!'),
          );
        }

        /// Initial State
        return SizedBox();
      },
    );
  }
}
