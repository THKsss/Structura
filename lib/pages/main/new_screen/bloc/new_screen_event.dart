part of 'new_screen_bloc.dart';

class NewScreenEvent {}

class LoadNewScreen extends NewScreenEvent {
  LoadNewScreen({
    this.completer,
  });

  final Completer? completer;
}

class LoadNextPage extends NewScreenEvent {
  LoadNextPage({
    required this.page,
  });
  final int page;
}
