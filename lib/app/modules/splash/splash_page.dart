import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burguer_mobile/app/routes/auth_routers.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0XFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: context.heightTransformer(reducedBy: 85)),
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(height: 60),
                  VakinhaButton(
                    label: 'ACESSAR',
                    width: context.widthTransformer(reducedBy: 25),
                    heigth: 60,
                    onpressed: () => Get.offAndToNamed(AuthRouters.LOGIN_PAGE),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
