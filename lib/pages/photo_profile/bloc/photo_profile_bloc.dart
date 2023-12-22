import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webant_test/pages/photo_profile/data/api/api_get_profile_photo.dart';
import 'package:webant_test/pages/photo_profile/data/models/photos_profile_data_model.dart';

part 'photo_profile_event.dart';
part 'photo_profile_state.dart';

class PhotoProfileBloc extends Bloc<PhotoProfileEvent, PhotoProfileState> {
  PhotoProfileBloc(this.profileData) : super(PhotoProfileInitial()) {
    on<LoadPhotoProfile>((event, emit) async {
      try {
        if (state is! PhotoProfileLoaded) {
          emit(PhotoProfileLoading());
        }
        final profileDataApi = await profileData.apiGetPhotos();
        emit(PhotoProfileLoaded(photoProfile: profileDataApi));
      } catch (e) {
        emit(PhotoProfileLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final PhotoProfileDataApi profileData;
}
