import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webant_test/pages/main/data/api/api_get_photos.dart';
import 'package:webant_test/pages/main/data/models/photos_list_model.dart';

part 'new_screen_event.dart';
part 'new_screen_state.dart';

class NewScreenBloc extends Bloc<NewScreenEvent, NewScreenState> {
  NewScreenBloc(this.photosApi) : super(NewScreenInitial()) {
    on<LoadNewScreen>(
      (event, emit) async {
        try {
          if (state is! NewScreenLoaded) {
            emit(NewScreenLoading());
          }
          List<PhotosListDataModel> photosNewDataApi =
              await photosApi.apiGetPhotos(true, 1, 12);
          emit(NewScreenLoaded(
            photosNewList: photosNewDataApi,
          ));
        } catch (e) {
          emit(NewScreenLoadingFailure(exception: e));
        } finally {
          event.completer?.complete();
        }
      },
    );

    on<LoadNextPage>(
      (event, emit) async {
        List<PhotosListDataModel> photosNewDataApi =
            await photosApi.apiGetPhotos(true, event.page, 12);
        emit(
          NewScreenLoaded(
            photosNewList: photosNewDataApi,
          ),
        );
      },
    );
  }

  final PhotosDataApi photosApi;
}
