import 'package:equatable/equatable.dart';

class ResturantEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResturantLoadEvent extends ResturantEvent {
  final String token;

  ResturantLoadEvent({required this.token});

}

