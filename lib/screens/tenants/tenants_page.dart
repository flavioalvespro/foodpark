import 'package:flutter/material.dart';

import '../../models/Tenant.dart';
import './widgets/TenantCard.dart';

class TenantsPage extends StatefulWidget {
  TenantsPage({Key? key}) : super(key: key);

  @override
  _TenantsPageState createState() => _TenantsPageState();
}

class _TenantsPageState extends State<TenantsPage> {

  List<Tenant> _tenants = [
    Tenant(uuid: '1', name: 'Arte da Pizza', image: 'fd', contact: 'artedapizza@gmail.com'),
    Tenant(uuid: '2', name: 'Pizza Mestre', image: 'fd', contact: 'pizzamestre@gmail.com'),
    Tenant(uuid: '3', name: 'Empório dos Alimentos', image: 'fd', contact: 'emporio@gmail.com'),
    Tenant(uuid: '4', name: 'Picuí Praia', image: 'fd', contact: 'picui@gmail.com'),
    Tenant(uuid: '5', name: 'NAO Frutos do Mar', image: 'fd', contact: 'nao@gmail.com'),
    Tenant(uuid: '6', name: 'Golfinhos Bar', image: 'fd', contact: 'golfinhos@gmail.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Restaurantes'),
        centerTitle: true,
      ),
      body: _buildTenants(context),
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