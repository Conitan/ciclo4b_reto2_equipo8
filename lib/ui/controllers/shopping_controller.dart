import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
  }

  void calcularTotal() {
    int newTotal = 0;
    // TODO - Jose Pineda
    // calcular el valor total de los elementos en el carro de compras
    for (var i = 0; i < entries.length; i++) {
      newTotal += entries[i].price * entries[i].quantity.value;
    }
    total.value = newTotal;
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');
    // TODO - Jose Pineda
    // Encontrar el elemento usando el id, revisar el método firstWhere de la lista
    // después obtener el index de ese elemento, revisar el método indexOf de la lista
    // después hacer el incremento en la cantidad
    // finalmente actualizar entries usando el indice y el elemento actualizado
    int aux =
        entries.indexOf(entries.firstWhere((element) => element.id == id));
    entries[aux].quantity += 1;
    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    // TODO - Jose Pineda
    // similar a agregarProducto
    // validar cuando la cantidad es igual a cero
    int aux =
        entries.indexOf(entries.firstWhere((element) => element.id == id));
    entries[aux].quantity.value == 0 ? 0 : entries[aux].quantity -= 1;
    calcularTotal();
  }
}
