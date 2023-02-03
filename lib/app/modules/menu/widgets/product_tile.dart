import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/formater_helper.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer_mobile/app/models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  const ProductTile({Key? key, required this.productModel}) : super(key: key);

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
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      'http://dartweek.academiadoflutter.com.br/images${productModel.image}'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      productModel.name,
                      style: VakinhaUI.textBold,
                    ),
                    Text(FormaterHelper.formatCurrency(productModel.price)),
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
