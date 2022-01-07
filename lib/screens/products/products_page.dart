import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodpark/stores/categories.store.dart';
import 'package:foodpark/stores/products.store.dart';
import 'package:foodpark/stores/tenant.store.dart';
import 'package:foodpark/widgets/custom_ciscular_progress_indicator.dart';
import 'package:provider/provider.dart';

import '../../models/CategoryProduct.dart';
import '../../models/Product.dart';
import './widgets/Categories.dart';
import '../../widgets/bottom_navigator.dart';
import 'package:foodpark/models/Tenant.dart';
import 'package:foodpark/widgets/product_card.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  late Tenant _tenant;
  late ProductsStore storeProduct;
  late CategoriesStore storeCategories;
  late TenantsStore storeTenants;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    storeProduct = Provider.of<ProductsStore>(context);
    storeCategories = Provider.of<CategoriesStore>(context);
    storeTenants = Provider.of<TenantsStore>(context);

    RouteSettings settings = ModalRoute.of(context)!.settings;
    _tenant = settings.arguments as Tenant;
    
    storeTenants.setTenant(_tenant);
    storeCategories.getCategories(_tenant.uuid);
    storeProduct.getProducts(_tenant.uuid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_tenant.name}'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreen(),
      bottomNavigationBar: BottomNavigator(0),
    );
  }

  Widget _buildScreen() {
    return Column(
      children: <Widget>[
        Observer(
          builder: (context) {
            return storeCategories.isLoading ?  CustomCircularProgressIndicator(textLabel: 'Carregando as categorias...') : storeCategories.categories.length == 0 ? Center(child: Text('Nenhuma categoria encontrada.', style: TextStyle(color: Colors.black),),) : Categories(storeCategories.categories);
          },
        ),
        Observer(
          builder: (context) {
            return storeProduct.isLoading ? CustomCircularProgressIndicator(textLabel: 'Carregando os produtos...') : storeProduct.products.length == 0 ? Center(child: Text('Nenhum produto encontrado.', style: TextStyle(color: Colors.black),),) : _buildProducts();
          },
        )
      ],
    );
  }

  Widget _buildProducts() {
    return Container(
      height: (MediaQuery.of(context).size.height - 190),
      width: MediaQuery.of(context).size.width,
      child:  ListView.builder(
              itemCount: storeProduct.products.length,
              itemBuilder: (context, index) {
                final Product product = storeProduct.products[index];
                return ProductCard(product: product);
              }),
    );
  }
}
