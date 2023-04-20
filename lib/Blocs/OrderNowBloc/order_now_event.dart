import 'package:equatable/equatable.dart';

abstract class OrderNowEvent extends Equatable{
  @override
  List<Object?> get props => [];

}
class OrderNowLoadingEvent extends OrderNowEvent{}
class OrderedEvent extends OrderNowEvent{
  final String token;
  final int resId;
  final int grandTotal;
  OrderedEvent(this.token,this.resId,this.grandTotal);
}
class OrderFinishedEvent extends OrderNowEvent{
  @override
  List<Object?> get props => [];
}