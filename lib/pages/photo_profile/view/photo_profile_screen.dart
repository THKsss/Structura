import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webant_test/core/core.dart';
import 'package:webant_test/pages/photo_profile/bloc/photo_profile_bloc.dart';
import 'package:webant_test/pages/photo_profile/data/api/api_get_profile_photo.dart';

import 'view.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _photoProfileBloc = PhotoProfileBloc(
    PhotoProfileDataApi(),
  );

  @override
  void initState() {
    _photoProfileBloc.add(LoadPhotoProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: blackClr,
        ),
        backgroundColor: whiteClr,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: BlocBuilder<PhotoProfileBloc, PhotoProfileState>(
              bloc: _photoProfileBloc,
              builder: (context, state) {
                if (state is PhotoProfileLoaded) {
                  DateTime date = DateTime.parse(state.photoProfile.dateCreate);
                  String dateCreated = DateFormat('dd MMM. yyyy').format(date);
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    child: ProfileInfo(
                      state: state,
                      dateCreated: dateCreated,
                    ),
                  );
                }
                if (state is PhotoProfileLoadingFailure) {
                  return const BlocErrorScreen();
                }
                return Center(
                  child: CircularProgressIndicator(color: activeClr),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
