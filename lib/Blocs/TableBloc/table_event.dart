// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/table_model.dart';

class TableEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartEvent extends TableEvent {}

class TableLoadedEvent extends TableEvent {
  int id ;
  TableLoadedEvent(this.id);
}

class FinalSelectionEvent extends TableEvent {
}
