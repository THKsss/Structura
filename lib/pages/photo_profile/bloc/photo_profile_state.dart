part of 'photo_profile_bloc.dart';

class PhotoProfileState {}

class PhotoProfileInitial extends PhotoProfileState {}

class PhotoProfileLoading extends PhotoProfileState {}

class PhotoProfileLoaded extends PhotoProfileState {
  PhotoProfileLoaded({
    required this.photoProfile,
  });
  final PhotoProfileDataModel photoProfile;
}

class PhotoProfileLoadingFailure extends PhotoProfileState {
  PhotoProfileLoadingFailure({
    required this.exception,
  });

  final Object? exception;
}
