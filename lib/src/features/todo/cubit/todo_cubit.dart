import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_cloud/src/features/todo/data/todo_repository_impl.dart';
import 'package:meta/meta.dart';

import '../models/todo_item_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepositoryImpl _todoRepository;

  TodoCubit(this._todoRepository) : super(TodoInitial());

  Future<void> getData() async {
    try {
      List<TodoItemModel> data = await _todoRepository.fetchData();
      emit(TodoLoaded(todoData: data));
    } on Exception {
      emit(TodoError(errorMessage: "Couldn't fetch Todo firebase data"));
    }
  }
}
