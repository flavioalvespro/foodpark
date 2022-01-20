import 'package:flutter/material.dart';
import 'package:foodpark/stores/auth.store.dart';
import 'package:foodpark/widgets/bottom_navigator.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  late AuthStore _authStore;

  @override
  Widget build(BuildContext context) {
    _authStore = Provider.of<AuthStore>(context);

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Meu Perfil'),
          centerTitle: true,
        ),
        body: Center(child: _buildProfileScreen(context)),
        bottomNavigationBar: BottomNavigator(3));
  }

  Widget _buildProfileScreen(context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _authStore.user.name,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Container(height: 10),
          Text(
            _authStore.user.email,
            style: TextStyle(color: Colors.black),
          ),
          Container(height: 10),
          Container(
            child: ElevatedButton(
              onPressed: () {
                print('logout');
              },
              child: Text('Sair'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  elevation: 2.2,
                  shadowColor: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
