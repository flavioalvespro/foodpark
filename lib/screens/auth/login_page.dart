import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodpark/stores/auth.store.dart';
import 'package:provider/provider.dart';

import './register_page.dart';
import './widgets/head_auth.dart';

class LoginScreen extends StatelessWidget {

  double _deviceWidth = 0;
  double _deviceHeight = 0;

  late AuthStore _authStore;
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    _authStore = Provider.of<AuthStore>(context);
    //coloca as features do sistema operacional visto que tirei na tela de splash screen
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) => _loginPageUI(context),
        ),
      ),
    );
  }

  Widget _loginPageUI(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.10),
      child: Column(
        children: <Widget>[
          Container(height: 50,),
          HeadAuth(),
          Container(height: 20,),
          _formLogin(context),
          Container(height: 20,),
          _loginButton(context),
          Container(height: 30,),
          _textRegister(context)
        ],
      ),
    );
  }

  Widget _formLogin(context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(143, 148, 251, .6),
            blurRadius: 20.0,
            offset: Offset(0,10)
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          _emailTextField(context),
          _passwordTextField(context)
        ],
      ),
    );
  }

  Widget _emailTextField(context) {
    return TextFormField(
      controller: _email,
      autocorrect: false,
      autofocus: true,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor)
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor)
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor)
        ),
        contentPadding: EdgeInsets.all(10),
        hintText: 'Email',
        hintStyle: TextStyle(color: Theme.of(context).primaryColor)
      ),
    );
  }

  Widget _passwordTextField(context) {
    return TextFormField(
      controller: _password,
      autocorrect: false,
      autofocus: true,
      obscureText: true,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor)
        ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: EdgeInsets.all(10),
        hintText: 'Senha',
        hintStyle: TextStyle(color: Theme.of(context).primaryColor)
      ),
    );
  }

  Widget _loginButton(context) {
    return Container(
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: () => _authStore.isLoading ? null : auth(context),
        color: Theme.of(context).primaryColor,
        child: Text(_authStore.isLoading ? 'Autenticando...' : 'Login'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }

  Widget _textRegister(context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(builder: (context) => RegisterScreen())
        // );
        Navigator.pushReplacementNamed(context, '/register');
      },
      child: Text('Cadastrar-se', style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18.2
              ),),
      );
  }

  Future auth(context) async
  {
    await _authStore.auth(_email.text, _password.text);

    Navigator.pushReplacementNamed(context, '/tenants') ;
  }
}