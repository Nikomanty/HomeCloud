import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_cloud/features/todo/cubit/todo_cubit.dart';
import 'package:home_cloud/features/todo/data/todo_service.dart';
import 'package:home_cloud/features/todo/models/todo.dart';
import 'package:mocktail/mocktail.dart';

class MockTodoService extends Mock implements TodoService {}

void main() {
  late MockTodoService mockTodoService;
  late TodoCubit todoCubitUT;

  late List<Todo> testTodos;

  Exception testException = Exception("Failed to get data");

  setUp(() {
    mockTodoService = MockTodoService();
    todoCubitUT = TodoCubit(mockTodoService);
    testTodos = [
      Todo(title: "test1", weekDay: "Muut", checked: false, documentId: "123"),
      Todo(title: "test2", weekDay: "Muut", checked: false, documentId: "456"),
      Todo(title: "test3", weekDay: "Muut", checked: false, documentId: "789"),
    ];
  });

  void whenGetDataCalledReturnTestTodos() {
    when(() => mockTodoService.fetchData()).thenAnswer((_) async => testTodos);
  }

  group(
    "Tests TodoCubit:",
    () {
      blocTest<TodoCubit, TodoState>(
        """Should emit TodoStatus.loading and TodoStatus.loaded 
        when TodoCubit getData() is called""",
        setUp: () => whenGetDataCalledReturnTestTodos(),
        build: () => todoCubitUT,
        act: (cubit) => cubit.getData(),
        expect: () => checkExpectedStates(
          TodoState(status: TodoStatus.loaded, todoData: testTodos),
        ),
        verify: (_) async {
          verify(() => mockTodoService.fetchData()).called(1);
        },
      );

      blocTest<TodoCubit, TodoState>(
        """Should emit TodoStatus.loading and TodoStatus.error 
        when TodoCubit getData() call is failed""",
        setUp: () =>
            when(() => mockTodoService.fetchData()).thenThrow(testException),
        build: () => todoCubitUT,
        act: (cubit) => cubit.getData(),
        expect: () => checkExpectedStates(
          TodoState(status: TodoStatus.error, exception: testException),
        ),
        verify: (_) async {
          verify(() => mockTodoService.fetchData()).called(1);
        },
      );

      Todo newTestTask = Todo(
        title: "newTestTask",
        weekDay: "Muut",
        checked: false,
        documentId: "4",
      );
      blocTest<TodoCubit, TodoState>(
        """Should add new todo to testTodos list, 
        emit TodoStatus.loading and TodoStatus.loaded 
        when TodoCubit createData() is called""",
        setUp: () {
          whenGetDataCalledReturnTestTodos();
          when(() => mockTodoService.createData(null, newTestTask.toMap()))
              .thenAnswer((_) async {
            testTodos.add(newTestTask);
          });
          //Check original state
          expect(testTodos.length, 3);
        },
        build: () => todoCubitUT,
        act: (cubit) {
          cubit.createData(null, newTestTask.toMap());
        },
        expect: () {
          expect(testTodos.length, 4);
          expect(testTodos[3], newTestTask);
          return checkExpectedStates(
              TodoState(status: TodoStatus.loaded, todoData: testTodos));
        },
        verify: (_) async {
          verify(() => mockTodoService.createData(null, newTestTask.toMap()))
              .called(1);
          verify(() => mockTodoService.fetchData()).called(1);
        },
      );

      const String deletedDocID = "456";
      const int testedIndex = 1;
      blocTest<TodoCubit, TodoState>(
        """Should delete item from testTodos list and 
        emit TodoStatus.loading and TodoStatus.loaded 
        when TodoCubit deleteData(String docId) is called""",
        setUp: () {
          whenGetDataCalledReturnTestTodos();
          when(() => mockTodoService.deleteData(deletedDocID))
              .thenAnswer((_) async {
            testTodos
                .removeWhere((element) => element.documentId == deletedDocID);
          });
          //Check original state of testTodo
          expect(testTodos.length, 3);
          expect(testTodos[testedIndex].title, "test2");
        },
        build: () => todoCubitUT,
        act: (cubit) => cubit.deleteData(deletedDocID),
        expect: () {
          expect(testTodos.length, 2);
          expect(testTodos[testedIndex].title, "test3");
          return checkExpectedStates(
              TodoState(status: TodoStatus.loaded, todoData: testTodos));
        },
        verify: (_) async {
          verify(() => mockTodoService.deleteData(deletedDocID)).called(1);
          verify(() => mockTodoService.fetchData()).called(1);
        },
      );
    },
  );
}

//Helper to check expected state after loading
List<TodoState> checkExpectedStates(TodoState expectedState) {
  return [
    //Loading status is always expected when get, update, delete, create data
    const TodoState(status: TodoStatus.loading),
    expectedState,
  ];
}
