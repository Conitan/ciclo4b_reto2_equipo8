import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/banner.dart';
import '../Widgets/cart_total.dart';
import 'product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Stack(
        children: [buildProfileImage(), customAppBar()],
      ),
      const SizedBox(
        height: 60,
      ),
      const Text("Equipo 8",
          style: TextStyle(
              fontSize: 25.0,
              color: Colors.blueGrey,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w400)),
      const SizedBox(
        height: 20,
      ),
      const Text(
        "Mision Tic 2022",
        style: TextStyle(
            fontSize: 18.0,
            color: Colors.black45,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w300),
      ),
      CartTotal()
    ]));
  }

  Widget buildProfileImage() {
    return Stack(
      alignment: Alignment.center,
      children: const [
        CustomBanner(200),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
              "https://cdn-icons-png.flaticon.com/512/2919/2919600.png"),
          radius: 60.0,
        )
      ],
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.to(() => const ProductList(),
                transition: Transition.circularReveal,
                duration: const Duration(seconds: 1)),
            child: const Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
