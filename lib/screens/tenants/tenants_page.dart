import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/Tenant.dart';
import './widgets/TenantCard.dart';
import '../../widgets/bottom_navigator.dart';

class TenantsPage extends StatefulWidget {
  TenantsPage({Key? key}) : super(key: key);

  @override
  _TenantsPageState createState() => _TenantsPageState();
}

class _TenantsPageState extends State<TenantsPage> {

  List<Tenant> _tenants = [
    Tenant(uuid: '1', name: 'Arte da Pizza', image: 'https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png', contact: 'artedapizza@gmail.com'),
    Tenant(uuid: '2', name: 'Pizza Mestre', image: 'https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png', contact: 'pizzamestre@gmail.com'),
    Tenant(uuid: '3', name: 'Empório dos Alimentos', image: 'https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png', contact: 'emporio@gmail.com'),
    Tenant(uuid: '4', name: 'Picuí Praia', image: 'https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png', contact: 'picui@gmail.com'),
    Tenant(uuid: '5', name: 'NAO Frutos do Mar', image: 'https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png', contact: 'nao@gmail.com'),
    Tenant(uuid: '6', name: 'Golfinhos Bar', image: 'https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png', contact: 'golfinhos@gmail.com'),
  ];

  @override
  Widget build(BuildContext context) {
    //coloca as features do sistema operacional visto que tirei na tela de splash screen
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Restaurantes'),
        centerTitle: true,
      ),
      body: _buildTenants(context),
      bottomNavigationBar: BottomNavigator(0),
    );
  }

  Widget _buildTenants(context) {
    return Container(
      child: ListView.builder(
        itemCount: _tenants.length,
        itemBuilder: (context, index){
          
          final Tenant tenant = _tenants[index];

          return TenantCard(uuid: tenant.uuid, name: tenant.name, image: tenant.image, contact: tenant.contact);
        }
      ),
    );
  }
}