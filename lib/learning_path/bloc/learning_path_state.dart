part of 'learning_path_bloc.dart';

@immutable
abstract class LearningPathState {}

class LearningPathInitial extends LearningPathState {}

class LoadingState extends LearningPathState {}

class GetLearningPathStateDone extends LearningPathState {
  final List<LearningPathModel> listOfPaths;
  GetLearningPathStateDone(this.listOfPaths);
}

class DataEmptyState extends LearningPathState {}

class FailedState extends LearningPathState {}