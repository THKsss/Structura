part of 'new_screen_bloc.dart';

class NewScreenState {}

class NewScreenInitial extends NewScreenState {}

class NewScreenLoading extends NewScreenState {}

class NewScreenLoaded extends NewScreenState {
  NewScreenLoaded({
    required this.photosNewList,
  });
  final List<PhotosListDataModel> photosNewList;
}

class NewScreenLoadingFailure extends NewScreenState {
  NewScreenLoadingFailure({
    required this.exception,
  });

  final Object? exception;
}
