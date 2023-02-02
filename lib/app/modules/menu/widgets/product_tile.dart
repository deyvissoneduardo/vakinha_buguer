import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_ui.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: Colors.amber,
        margin: const EdgeInsets.all(10.0),
        height: 80,
        child: Row(
          children: [
            Container(
              height: 80,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.exampledomain.com/images/background.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('X-TUDO', style: VakinhaUI.textBold,),
                    Text(r'R$ 200,00'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
