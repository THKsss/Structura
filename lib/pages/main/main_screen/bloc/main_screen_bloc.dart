import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webant_test/pages/main/data/api/api_get_photos.dart';
import 'package:webant_test/pages/main/data/models/photos_list_model.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc(this.photosApi) : super(MainScreenInitial()) {
    on<LoadMainScreen>(
      (event, emit) async {
        try {
          if (state is! MainScreenLoaded) {
            emit(MainScreenLoading());
          }
          List<PhotosListDataModel> photosNewDataApi =
              await photosApi.apiGetPhotos(true, 1, 12);
          List<PhotosListDataModel> photosPopularDataApi =
              await photosApi.apiGetPhotos(false, 1, 12);
          emit(MainScreenLoaded(
            photosNewList: photosNewDataApi,
            photosPopularList: photosPopularDataApi,
          ));
        } catch (e) {
          emit(MainScreenLoadingFailure(exception: e));
        } finally {
          event.completer?.complete();
        }
      },
    );

    on<LoadNextPageNew>(
      (event, emit) async {
        List<PhotosListDataModel> photosNewDataApi =
            await photosApi.apiGetPhotos(true, event.page, 10);
        List<PhotosListDataModel> photosPopularDataApi =
            await photosApi.apiGetPhotos(false, 1, 12);
        emit(
          MainScreenLoaded(
            photosNewList: photosNewDataApi,
            photosPopularList: photosPopularDataApi,
          ),
        );
      },
    );
    on<LoadNextPagePopular>(
      (event, emit) async {
        List<PhotosListDataModel> photosNewDataApi =
            await photosApi.apiGetPhotos(true, 1, 12);
        List<PhotosListDataModel> photosPopularDataApi =
            await photosApi.apiGetPhotos(false, event.page, 10);
        emit(
          MainScreenLoaded(
            photosNewList: photosNewDataApi,
            photosPopularList: photosPopularDataApi,
          ),
        );
      },
    );
  }

  final PhotosDataApi photosApi;
}
