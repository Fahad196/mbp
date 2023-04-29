import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/order_summary_model.dart';

abstract class OrderSummaryState extends Equatable{
  @override
  List<Object?> get props => [];

}

class OrderSummaryLoadingState extends OrderSummaryState{}
class OrderSummaryLoadedState extends OrderSummaryState{
 final List<OrderSummaryModel> orders;
  OrderSummaryLoadedState(this .orders);
  @override
  List<Object?> get props => [orders];
}
class OrderSummaryErrorState extends OrderSummaryState{
  final String message;
  OrderSummaryErrorState(this.message);
}