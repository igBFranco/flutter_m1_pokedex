import 'package:flutter/material.dart';

//widget com a imagem dos tipos para ser utilizado na tela de detalhes
class DetailTypesImage extends StatelessWidget {
  final int id;
  const DetailTypesImage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 200,
      ),
      child: Center(
        child: Stack(
          children: [
            Container(
              height: 150,
              width: 150,
            ),
            Center(child: Image(image: AssetImage('assets/img/${id}.png'))),
          ],
        ),
      ),
    );
  }
}
