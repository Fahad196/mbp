 import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];

} 

class ProfileLoadingEvent extends ProfileEvent{

}

class ProfileLoadedEvent extends ProfileEvent{
  final String token;
  ProfileLoadedEvent(this.token); 
}