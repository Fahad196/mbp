import 'package:equatable/equatable.dart';

class DeleteCartEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class DeleteCartLoadingEvent extends DeleteCartEvent{

}
class DeleteItemCartEvent extends DeleteCartEvent{
  int itemId;
  int resturantId;
  String portion;
DeleteItemCartEvent(this.itemId,this.resturantId,this.portion);
}
