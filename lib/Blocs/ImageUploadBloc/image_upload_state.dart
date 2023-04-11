// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/food_category_model.dart';
import '../../Models/dashboard_todaydish_model.dart';

class ImageUploadState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ImageUploadLoadingState extends ImageUploadState {}

class ImageUploadedstate extends ImageUploadState {
  final String image;
  ImageUploadedstate(this.image);
  @override
  List<Object?> get props => [image];
}

class ImageUploadErrorState extends ImageUploadState {
  final String message;
  ImageUploadErrorState({required this.message});
}
