import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webant_test/pages/main/data/api/api_get_photos.dart';
import 'package:webant_test/pages/main/data/models/photos_list_model.dart';

part 'popular_screen_event.dart';
part 'popular_screen_state.dart';

class PopularScreenBloc extends Bloc<PopularScreenEvent, PopularScreenState> {
  PopularScreenBloc(this.photosApi) : super(PopularScreenInitial()) {
    on<LoadPopularScreen>(
      (event, emit) async {
        try {
          if (state is! PopularScreenLoaded) {
            emit(PopularScreenLoading());
          }
          final photosPopularDataApi =
              await photosApi.apiGetPhotos(false, 1, 12);
          emit(PopularScreenLoaded(photosPopularList: photosPopularDataApi));
        } catch (e) {
          emit(PopularScreenLoadingFailure(exception: e));
        } finally {
          event.completer?.complete();
        }
      },
    );

    on<LoadNextPage>(
      (event, emit) async {
        final photosPopularDataApi =
            await photosApi.apiGetPhotos(false, event.page, 12);
        emit(PopularScreenLoaded(photosPopularList: photosPopularDataApi));
      },
    );
  }

  final PhotosDataApi photosApi;
}
