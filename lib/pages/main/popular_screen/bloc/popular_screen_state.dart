part of 'popular_screen_bloc.dart';

class PopularScreenState {}

class PopularScreenInitial extends PopularScreenState {}

class PopularScreenLoading extends PopularScreenState {}

class PopularScreenLoaded extends PopularScreenState {
  PopularScreenLoaded({
    required this.photosPopularList,
  });
  final List<PhotosListDataModel> photosPopularList;
}

class PopularScreenLoadingFailure extends PopularScreenState {
  PopularScreenLoadingFailure({
    required this.exception,
  });

  final Object? exception;
}
