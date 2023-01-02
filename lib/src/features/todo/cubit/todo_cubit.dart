import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_cloud/src/features/todo/data/todo_repository_impl.dart';
import 'package:home_cloud/src/features/todo/models/todo_item_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _todoRepository;

  TodoCubit(this._todoRepository) : super(const TodoState());

  Future<void> updateData() async {
    emit(state.copyWith(status: TodoStatus.update));
    getData();
  }

  Future<void> getData() async {
    try {
      List<TodoItemModel> data = await _todoRepository.fetchData();
      emit(state.copyWith(status: TodoStatus.loaded, todoData: data));
    } on Exception catch (exception) {
      emit(state.copyWith(status: TodoStatus.error, exception: exception));
    }
  }
}
