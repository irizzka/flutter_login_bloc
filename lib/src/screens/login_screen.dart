import 'package:flutter/material.dart';
import 'package:flutter_login_bloc/src/blocs/bloc.dart';
import 'package:flutter_login_bloc/src/blocs/provider.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin:  EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
           SizedBox(height: 25.0),
          submitButton(bloc)
        ],
      ),
    );
  }



  Widget emailField(Bloc bloc) {

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

  Widget passwordField(Bloc bloc) {

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

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot){
        return RaisedButton(

          child: const Text('Login'),
          color: Colors.blue,
          onPressed: snapshot.hasData ? (){
            bloc.submit();
          } : null,
        );
      },
    );
  }
}