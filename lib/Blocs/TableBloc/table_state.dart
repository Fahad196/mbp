// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:equatable/equatable.dart';

import 'package:mybigplate/Models/table_model.dart';

class TableState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TableLoadingState extends TableState {}

class TableLoadedState extends TableState {
  final List<TableModel> tables;
  TableLoadedState({required this.tables});
  @override
  List<Object?> get props => [tables];
}

class FinalSelectionState extends TableState {}

class TableErrorState extends TableState {
  final message;
  TableErrorState({required this.message});
}
