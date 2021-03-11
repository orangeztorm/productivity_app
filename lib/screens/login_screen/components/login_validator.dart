import 'dart:async';

mixin Validators{
  var nameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink){
      if(name.length == 0) sink.addError('Yo, wee need your name');
      else sink.add(name);
    }
  );
}