
import 'package:equatable/equatable.dart';

 abstract class ImageUploadEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class ImageUploadLoadingEvent extends ImageUploadEvent{}
class ImageUploadedEvent extends ImageUploadEvent{
 final String image;
 final String token ;
  ImageUploadedEvent( this.image,this.token);
  @override
  List<Object?> get props => [image];

}