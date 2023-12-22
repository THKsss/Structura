part of 'main_screen_bloc.dart';

class MainScreenEvent {}

class LoadMainScreen extends MainScreenEvent {
  LoadMainScreen({
    this.completer,
  });

  final Completer? completer;
}

class LoadNextPageNew extends MainScreenEvent {
  LoadNextPageNew({
    required this.page,
  });
  final int page;
}

class LoadNextPagePopular extends MainScreenEvent {
  LoadNextPagePopular({
    required this.page,
  });
  final int page;
}
