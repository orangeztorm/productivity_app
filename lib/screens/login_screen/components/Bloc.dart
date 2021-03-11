import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'login_validator.dart';

class Bloc extends Object with Validators implements BaseBloc{

  final _nameController = BehaviorSubject<String>();

  Function(String) get nameChanged => _nameController.sink.add;

  Stream<String> get name => _nameController.stream.transform(nameValidator);

  Stream<bool> get submitCheck => Rx.fromCallable(() =>  true);

  @override
  void dispose() {
    _nameController?.close();
  }

}

abstract class BaseBloc{
  void dispose();
}