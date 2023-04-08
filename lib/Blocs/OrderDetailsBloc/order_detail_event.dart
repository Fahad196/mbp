import 'package:equatable/equatable.dart';

abstract class OrderDetailEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class OrderDetailLoadingEvent extends OrderDetailEvent{}
class OrderDetailLoadedEvent extends OrderDetailEvent{
  final String token;
  final int orderId;
  OrderDetailLoadedEvent(this.token,this.orderId);
}