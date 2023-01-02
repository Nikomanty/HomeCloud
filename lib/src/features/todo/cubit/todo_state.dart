part of 'todo_cubit.dart';

enum TodoStatus { initial, update, loaded, error }

class TodoState extends Equatable {
  final TodoStatus status;
  final List<TodoItemModel>? todoData;
  final Exception? exception;

  const TodoState({
    this.status = TodoStatus.initial,
    this.todoData,
    this.exception,
  });

  TodoState copyWith({
    TodoStatus? status,
    List<TodoItemModel>? todoData,
    Exception? exception,
  }) {
    return TodoState(
      status: status ?? this.status,
      todoData: todoData ?? this.todoData,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [status, todoData, exception];
}
