 import 'package:equatable/equatable.dart';

abstract class internetState extends Equatable{
  @override
  List<Object?> get props => [];

}

class InternetInitailState extends internetState{

}

class InternetLostState extends internetState{

}

class InternetGainedState extends internetState{

}