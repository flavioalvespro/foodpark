import 'package:flutter/material.dart';
import 'package:foodpark/widgets/bottom_navigator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'Flávio Alves',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Container(height: 10),
          Text(
            'flavioalves@faduc.com.br',
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
