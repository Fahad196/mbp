import 'package:equatable/equatable.dart';

abstract class OrderSummaryEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class OrderSummaryLoadingEvent extends OrderSummaryEvent{}
class OrderSummaryLoadedEvent extends OrderSummaryEvent{
  final String token;
  OrderSummaryLoadedEvent(this.token);
}