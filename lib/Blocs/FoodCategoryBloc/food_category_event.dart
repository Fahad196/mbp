import 'package:equatable/equatable.dart';

 abstract class FoodCategoryEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class FoodCategoryLoadingEvent extends FoodCategoryEvent{}
class FoodCategoryLoadedEvent extends FoodCategoryEvent{
 final int resId;
 final int catId;
  FoodCategoryLoadedEvent(this.resId, this.catId);

}