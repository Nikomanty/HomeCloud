import 'package:bloc/bloc.dart';

// ignore_for_file: avoid_print
class HomeCloudBlocObserver extends BlocObserver {

  @override
  void onCreate(BlocBase bloc) {
    print("onCreate: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print("onEvent: $event");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print("onChange: $change");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("onTransition: $transition");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print("onError: $error");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    print("onClose: $bloc");
    super.onClose(bloc);
  }

}