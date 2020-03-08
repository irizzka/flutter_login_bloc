import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_login_bloc/src/blocs/validators.dart';

class Bloc with Validators{
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // add data to stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);

  //change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  submit(){
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print(validEmail + '   ' + validPassword);
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
