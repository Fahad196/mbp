import 'package:equatable/equatable.dart';

abstract class OrderNowEvent extends Equatable{
  @override
  List<Object?> get props => [];

}
class OrderNowLoadingEvent extends OrderNowEvent{}
class OrderedEvent extends OrderNowEvent{
  String token;
  int resId;
  int grandTotal;
  OrderedEvent(this.token,this.resId,this.grandTotal);
}