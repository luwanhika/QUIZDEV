import 'package:flutter/material.dart';

import '../core/app_gradients.dart';
import '../core/app_images.dart';
import '../home/home_page.dart';

class SplashPage extends StatelessWidget {

  // String nome;
  // SplashPage({this.nome});
  // final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    // Substituir por tela de cadastro ou edição
    // final user = UserModel(name: "Lwa", score: 0);
    // controller.saveUser(user);

    // controller.getUser(); // Para pegar usar no banco.

    Future.delayed(Duration(seconds: 2)).then((_) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        ));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(child: Image.asset(AppImages.logo)),
      ),
    );
  }
}
