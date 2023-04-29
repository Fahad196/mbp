// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybigplate/Blocs/ImageUploadBloc/image_upload_bloc.dart';
import 'package:mybigplate/Blocs/ImageUploadBloc/image_upload_event.dart';
import 'package:mybigplate/Blocs/ImageUploadBloc/image_upload_state.dart';
import 'package:mybigplate/Blocs/ProfileBloc/profile_bloc.dart';
import 'package:mybigplate/Blocs/ProfileBloc/profile_event.dart';
import 'package:mybigplate/Blocs/ProfileBloc/profile_state.dart';
import 'package:mybigplate/Models/profile_model.dart';
import 'package:mybigplate/Util/colors.dart';
import 'package:mybigplate/Util/screen_sizes.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.token,
  });
  final String token;
  // final int index;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final picker = ImagePicker();
  File? image;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileBloc>(context).add(ProfileLoadedEvent(widget.token));
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: AppColors.darkOrange,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          if (state is ProfileLoadingState) {
            return Text("Somthing Went Wrong");
          } else if (state is ProfileLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.darkOrange,
              ),
            );
          } else if (state is ProfileLoadedState) {
            List<ProfileModel> profiles = state.profiles;
            return Column(
              children: [
                SizedBox(
                  height: ScreenSizes.isMeduimScreen(context) ? 20.sp : 30.sp,
                ),
                Text(
                  "Click on avatar to change your Profile Picture",
                  style: TextStyle(fontFamily: 'met'),
                ),
                SizedBox(
                  height: ScreenSizes.isMeduimScreen(context) ? 5.sp : 10.sp,
                ),
                InkWell(
                  onTap: () {
                    pickImage();
                  },
                  child: CircleAvatar(
                    child: BlocBuilder<ImageUploadBloc, ImageUploadState>(
                        builder: (context, state) {
                      if (state is ImageUploadLoadingState) {
                        return Center(child: Text("No Image"));
                      } else if (state is ImageUploadedstate) {
                        return image != null
                            ? ClipOval(
                                child: Image.file(
                                image!,
                                fit: BoxFit.cover,
                              ))
                            : ClipOval(
                                child: Image.asset(
                                  "assets/defaultavatar.png",
                                  fit: BoxFit.fill,
                                ),
                              );
                      }
                      return Text(
                        "no image",
                        style: TextStyle(color: AppColors.textColorWhite),
                      );
                    }),
                    radius: ScreenSizes.isMeduimScreen(context) ? 40.sp : 60.sp,
                    backgroundColor: AppColors.textColorWhite,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (image != null) {
                      BlocProvider.of<ImageUploadBloc>(context)
                          .add(ImageUploadedEvent(image!.path, widget.token));
                    }
                  },
                  child: Text(
                    "Upload",
                    style: TextStyle(fontFamily: 'met'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkOrange,
                    fixedSize: Size(
                        ScreenSizes.isMeduimScreen(context) ? 60.sp : 100.sp,
                        ScreenSizes.isMeduimScreen(context) ? 10.sp : 20.sp),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 20.sp, horizontal: 30.sp),
                  padding: EdgeInsets.all(10.sp),
                  height: 300.sp,
                  decoration: BoxDecoration(
                      color: AppColors.textColorWhite,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 3,
                            color: AppColors.dividerColor.withOpacity(.4))
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 5.sp,
                      ),
                      Text("Full Name",
                          style: TextStyle(
                              fontFamily: 'met',
                              fontSize: ScreenSizes.isMeduimScreen(context)
                                  ? 8.sp
                                  : 15.sp,
                              color: AppColors.dividerColor)),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Text(
                          "${profiles.firstWhere((element) => element.firstName != null).firstName.toString() + " " + profiles.firstWhere((element) => element.lastName != null).lastName.toString()}",
                          style: TextStyle(
                            fontFamily: 'met',
                            fontSize: ScreenSizes.isMeduimScreen(context)
                                ? 9.sp
                                : 17.sp,
                          )),
                      Divider(
                        color: AppColors.darkOrange,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Text("Designation",
                          style: TextStyle(
                              fontFamily: 'met',
                              fontSize: ScreenSizes.isMeduimScreen(context)
                                  ? 8.sp
                                  : 15.sp,
                              color: AppColors.dividerColor)),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Text(
                          profiles
                              .firstWhere(
                                  (element) => element.designation != null)
                              .designation
                              .toString(),
                          style: TextStyle(
                            fontFamily: 'met',
                            fontSize: ScreenSizes.isMeduimScreen(context)
                                ? 9.sp
                                : 17.sp,
                          )),
                      Divider(
                        color: AppColors.darkOrange,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Text("Email",
                          style: TextStyle(
                              fontFamily: 'met',
                              fontSize: ScreenSizes.isMeduimScreen(context)
                                  ? 8.sp
                                  : 15.sp,
                              color: AppColors.dividerColor)),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Text(
                          profiles
                              .firstWhere((element) => element.email != null)
                              .email
                              .toString(),
                          style: TextStyle(
                            fontFamily: 'met',
                            fontSize: ScreenSizes.isMeduimScreen(context)
                                ? 9.sp
                                : 17.sp,
                          )),
                      Divider(
                        color: AppColors.darkOrange,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
              ],
            );
          }
          return Container();
        }));
  }

  Future pickImage() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 300, maxWidth: 300);
    setState(() {});
    image = File(pickedFile!.path);
  }
}
