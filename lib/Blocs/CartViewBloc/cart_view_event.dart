import 'package:equatable/equatable.dart';

abstract class CartViewEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class CartViewLoadingEvent extends CartViewEvent{}
class CartViewLoadedEvent extends CartViewEvent{
  final String token;
  CartViewLoadedEvent(this.token);
}