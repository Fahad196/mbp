 // ignore_for_file: camel_case_types

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