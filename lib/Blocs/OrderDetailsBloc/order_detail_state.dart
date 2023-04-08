import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/order_summary_model.dart';

import '../../Models/order_detail_model.dart';

abstract class OrderDetailState extends Equatable{
  @override
  List<Object?> get props => [];

}

class OrderDetailLoadingState extends OrderDetailState{}
class OrderDetailLoadedState extends OrderDetailState{
  List<OrderDetailModel> ordersDetail;
  OrderDetailLoadedState(this.ordersDetail);
  @override
  List<Object?> get props => [ordersDetail];
}
class OrderDetailErrorState extends OrderDetailState{
  final String message;
  OrderDetailErrorState(this.message);
}