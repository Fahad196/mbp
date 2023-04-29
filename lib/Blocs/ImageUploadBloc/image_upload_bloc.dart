// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/ImageUploadBloc/image_upload_event.dart';
import 'package:mybigplate/Blocs/ImageUploadBloc/image_upload_state.dart';
import 'package:mybigplate/Repositories/image_upload_repository.dart';

class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  ImageUploadRepository repository;
  ImageUploadBloc(this.repository) : super(ImageUploadLoadingState()) {
    on<ImageUploadLoadingEvent>(
        (event, emit) => emit(ImageUploadLoadingState()));
    on<ImageUploadedEvent>((event, emit) async {
      var data = await repository.uploadImage(event.image, event.token);
      log("image ${event.image.toString()}");
       log("token ${event.token.toString()}");
      log("data:::::::::: $data");
        emit(ImageUploadedstate(data));
      try {} catch (e) {
        log(e.toString());
        emit(ImageUploadErrorState(message: e.toString()));
      }
    });
  }
}
