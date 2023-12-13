import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/utils/Paletas_cores.dart';
import 'package:flutter/material.dart';

class ImagemPerfil extends StatelessWidget {
  final String urlImage;
  final bool foiVisualizado;

  const ImagemPerfil(
      {super.key, required this.urlImage, this.foiVisualizado = false});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: foiVisualizado ? Colors.grey[800] : PaletaCores.blueFacebook,
      child: CircleAvatar(
        radius: 20,
        backgroundImage: CachedNetworkImageProvider(urlImage),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
