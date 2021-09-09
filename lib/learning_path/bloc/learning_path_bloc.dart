import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../exports.dart';

part 'learning_path_event.dart';
part 'learning_path_state.dart';

class LearningPathBloc extends Bloc<LearningPathEvent, LearningPathState> {
  LearningPathBloc(
    LearningPathRepository? learningPathRepository,
  )   : assert(learningPathRepository != null),
        _learningPathRepository = learningPathRepository,
        super(LearningPathInitial());

  LearningPathRepository? _learningPathRepository;

  @override
  Stream<LearningPathState> mapEventToState(LearningPathEvent event) async* {
    if (event is GetLearningPathEvent) {
      yield LoadingState();
      final apiResponse = await _learningPathRepository!.getLearningPaths();

      if (apiResponse.statusCode == 200) {
        yield GetLearningPathStateDone(apiResponse.data!);
      } else if (apiResponse.data!.isEmpty) {
        yield DataEmptyState();
      } else {
        yield FailedState();
      }
    }
  }
}
