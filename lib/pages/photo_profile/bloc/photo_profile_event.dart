part of 'photo_profile_bloc.dart';

class PhotoProfileEvent {}

class LoadPhotoProfile extends PhotoProfileEvent {
  LoadPhotoProfile({
    this.completer,
  });
  final Completer? completer;
}
