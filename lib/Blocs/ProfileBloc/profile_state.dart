import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/profile_model.dart';

abstract class ProfileState extends Equatable{
  @override
  List<Object?> get props => [];

}

class ProfileLoadingState extends ProfileState{}
class ProfileLoadedState extends ProfileState{
  final List<ProfileModel> profiles;
  ProfileLoadedState(this.profiles);
  @override
  List<Object?> get props => [profiles];
}
class ProfileErrorState extends ProfileState{
 final String message;
  ProfileErrorState(this.message);
}