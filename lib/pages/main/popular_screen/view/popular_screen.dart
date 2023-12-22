import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webant_test/core/core.dart';
import 'package:webant_test/pages/main/data/api/api_get_photos.dart';
import 'package:webant_test/pages/main/popular_screen/bloc/popular_screen_bloc.dart';

import 'view.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  final _popularScreenBloc = PopularScreenBloc(PhotosDataApi());

  ScrollController scrollController = ScrollController();

  List<Widget> tempList = [], photoPopularList = [];
  int page = 1;
  bool isEndPopular = false;

  @override
  void initState() {
    _popularScreenBloc.add(LoadPopularScreen());
    scrollController.addListener(() => scrollListener());
    super.initState();
  }

  @override
  void dispose() {
    _popularScreenBloc.close();
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels != 0) {
        fetch();
      }
    }
  }

  Future fetch() async {
    page++;
    _popularScreenBloc.add(LoadNextPage(page: page));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    double height = mediaQuery.size.height;
    Orientation orientation = mediaQuery.orientation;

    return Scaffold(
      backgroundColor: whiteClr,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            BlocBuilder<PopularScreenBloc, PopularScreenState>(
              bloc: _popularScreenBloc,
              builder: (context, state) {
                if (state is PopularScreenLoaded) {
                  afterBlocEvent(state);
                  return Column(
                    children: [
                      orientation == Orientation.portrait
                          ? PhotosListBodyPortrait(
                              scrollController: scrollController,
                              tempList: tempList,
                              refresh: _refresh,
                            )
                          : PhotosListBodyLandscape(
                              scrollController: scrollController,
                              tempList: tempList,
                              refresh: _refresh,
                            ),
                      isEndPopular
                          ? SizedBox(
                              width: width,
                              height: height * 0.1,
                              child: Center(
                                child: SizedBox(
                                  height: width * 0.1,
                                  child: ASText(
                                    text: "It's the end",
                                    color: blackClr,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: width,
                              height: height * 0.1,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: activeClr,
                                ),
                              ),
                            ),
                    ],
                  );
                }
                if (state is PopularScreenLoadingFailure) {
                  return const BlocErrorScreen();
                }
                return SizedBox(
                  height: height * 0.1,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: activeClr,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future _refresh() async {
    tempList.clear();
    page = 2;
    isEndPopular = false;
    _popularScreenBloc.add(LoadPopularScreen());
  }

  void afterBlocEvent(PopularScreenLoaded state) async {
    photoPopularList.clear();

    for (int i = 0; i < state.photosPopularList.length; i++) {
      photoPopularList.add(
        PhotosCard(
          id: state.photosPopularList[i].id,
          image: state.photosPopularList[i].image,
        ),
      );
      tempList.add(photoPopularList[i]);
    }

    if (state.photosPopularList.isEmpty) {
      isEndPopular = true;
    } else {
      isEndPopular = false;
    }
  }
}

class PhotosListBodyPortrait extends StatelessWidget {
  const PhotosListBodyPortrait({
    super.key,
    required this.scrollController,
    required this.tempList,
    required this.refresh,
  });

  final ScrollController scrollController;
  final List<Widget> tempList;
  final Function() refresh;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    double height = mediaQuery.size.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.9,
          child: RefreshIndicator(
            onRefresh: () async {
              refresh();
            },
            edgeOffset: 90,
            displacement: 100,
            color: activeClr,
            child: GridView.builder(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                width * 0.02564,
                170,
                width * 0.02564,
                0,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: width * 0.02564,
                mainAxisSpacing: width * 0.02564,
                crossAxisCount: 2,
                childAspectRatio: 1.59,
              ),
              itemCount: tempList.length,
              itemBuilder: (_, index) {
                if (index < tempList.length) {
                  return tempList[index];
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: activeClr,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class PhotosListBodyLandscape extends StatelessWidget {
  const PhotosListBodyLandscape({
    super.key,
    required this.scrollController,
    required this.tempList,
    required this.refresh,
  });

  final ScrollController scrollController;
  final List<Widget> tempList;
  final Function() refresh;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    double height = mediaQuery.size.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.9,
          child: RefreshIndicator(
            onRefresh: () async {
              refresh();
            },
            edgeOffset: 50,
            displacement: 50,
            color: activeClr,
            child: GridView.builder(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                width * 0.07564,
                100,
                width * 0.07564,
                0,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: width * 0.01564,
                mainAxisSpacing: width * 0.01564,
                crossAxisCount: 4,
                childAspectRatio: 1.59,
              ),
              itemCount: tempList.length,
              itemBuilder: (_, index) {
                if (index < tempList.length) {
                  return tempList[index];
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: activeClr,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
