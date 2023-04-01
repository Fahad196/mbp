import 'package:equatable/equatable.dart';

 abstract class FoodCategoryEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class FoodCategoryLoadingEvent extends FoodCategoryEvent{}
class FoodCategoryLoadedEvent extends FoodCategoryEvent{
 final int resId;
 final int catId;
 final String token ;
  FoodCategoryLoadedEvent(this.resId, this.catId,this.token);

}