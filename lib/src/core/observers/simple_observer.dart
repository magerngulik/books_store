import 'package:bloc/bloc.dart';

class SimpleBloc extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(bloc);
    print(change);
  }
}
