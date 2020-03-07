import 'package:flutter/material.dart';
import 'package:flutter_login_bloc/src/blocs/bloc.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
           SizedBox(height: 25.0),
          submitButton()
        ],
      ),
    );
  }


  Widget emailField() {

    return StreamBuilder(
      stream:  bloc.email,
      builder: (context, snapshot){
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration:  InputDecoration(
            hintText: 'your@mail.ru',
            labelText: 'Email Address',
            errorText:  snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField() {

    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot){
        return TextField(
          onChanged: bloc.changePassword,
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration:  InputDecoration(
            hintText:  'password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );


  }

  Widget submitButton() {
    return RaisedButton(
      child: const Text('Login'),
      color: Colors.blue,
      onPressed: (){

      },
    );
  }
}