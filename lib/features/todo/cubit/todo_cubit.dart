import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_cloud/features/todo/data/todo_service.dart';
import 'package:home_cloud/features/todo/models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoService _todoService;

  TodoCubit(this._todoService) : super(const TodoState());

  Future<void> createData(
    String? documentId,
    Map<String, dynamic> newDocumentObject,
  ) async {
    try {
      await _todoService.createData(documentId, newDocumentObject);
      await getData();
    } on Exception {
      return;
    }
  }

  Future<void> deleteData(String? documentId) async {
    try {
      await _todoService.deleteData(documentId);
      await getData();
    } on Exception {
      return;
    }
  }

  Future<void> getData() async {
    emit(state.copyWith(status: TodoStatus.loading));
    try {
      List<Todo> data = await _todoService.fetchData();
      emit(state.copyWith(status: TodoStatus.loaded, todoData: data));
    } on Exception catch (exception) {
      emit(state.copyWith(status: TodoStatus.error, exception: exception));
    }
  }
}
