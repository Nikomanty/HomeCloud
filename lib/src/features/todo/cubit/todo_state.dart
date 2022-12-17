part of 'todo_cubit.dart';

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoItemModel> todoData;
  TodoLoaded({required this.todoData});
}

class TodoError extends TodoState {
  final String errorMessage;
  TodoError({required this.errorMessage});
}

@immutable
abstract class TodoState extends Equatable {
  @override
  List<Object> get props => [];
}