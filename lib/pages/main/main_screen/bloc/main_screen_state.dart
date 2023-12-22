part of 'main_screen_bloc.dart';

class MainScreenState {}

class MainScreenInitial extends MainScreenState {}

class MainScreenLoading extends MainScreenState {}

class MainScreenLoaded extends MainScreenState {
  MainScreenLoaded({
    required this.photosNewList,
    required this.photosPopularList,
  });
  final List<PhotosListDataModel> photosNewList;
  final List<PhotosListDataModel> photosPopularList;
}

class MainScreenLoadingFailure extends MainScreenState {
  MainScreenLoadingFailure({
    required this.exception,
  });

  final Object? exception;
}
