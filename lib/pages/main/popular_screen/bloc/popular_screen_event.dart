part of 'popular_screen_bloc.dart';

class PopularScreenEvent {}

class LoadPopularScreen extends PopularScreenEvent {
  LoadPopularScreen({
    this.completer,
  });

  final Completer? completer;
}

class LoadNextPage extends PopularScreenEvent {
  LoadNextPage({
    required this.page,
  });
  final int page;
}
