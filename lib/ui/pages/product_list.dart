import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/product.dart';
import '../Widgets/banner.dart';
import '../controllers/shopping_controller.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ShoppingController shoppingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [const CustomBanner(50), customAppBar()],
            ),
            // TODO - Jesus David
            // No se agrego ningun Obx en esta parte, ya que no funcionaba.
            // El Obx que observa los cambios del array entries esta mas abajo.
            // Obx(() => Expanded(
            //       child: ListView.builder(
            //           padding: const EdgeInsets.all(8),
            //           itemCount: shoppingController.entries.length,
            //           itemBuilder: (context, index) {
            //             return _row(shoppingController.entries[index], index);
            //           }),
            //     )),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: shoppingController.entries.length,
                  itemBuilder: (context, index) {
                    return _row(shoppingController.entries[index], index);
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Product product, int index) {
    return _card(product);
  }

  Widget _card(Product product) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(product.name),
        Text(product.price.toString()),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  // TODO - Carlos Fernando
                  // aqu?? debemos llamar al m??todo del controlador que
                  // incrementa el n??mero de unidades del producto
                  // pasandole el product.id
                  shoppingController.agregarProducto(product.id);
                },
                icon: const Icon(Icons.add_circle)),
            IconButton(
                onPressed: () {
                  // TODO - Carlos Fernando
                  // aqu?? debemos llamar al m??todo del controlador que
                  // disminuye el n??mero de unidades del producto
                  // pasandole el product.id
                  shoppingController.quitarProducto(product.id);
                },
                icon: const Icon(Icons.remove_circle))
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Cantidad"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              // child: Text(product.quantity.toString()),
              // TODO - Jose Pineda
              child: Obx(() => Text(product.quantity.toString())),
            ),
          ],
        )
      ]),
    );
  }
}
