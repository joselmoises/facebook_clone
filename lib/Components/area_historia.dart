import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/Components/image_perfil.dart';
import 'package:facebook_interface/dados/dados.dart';
import 'package:facebook_interface/utils/Paletas_cores.dart';
import 'package:flutter/material.dart';

import '../models/modelos.dart';

class AreaHistoria extends StatelessWidget {
  final Usuario usuario;

  final List<Historia> historias;

  const AreaHistoria(
      {super.key, required this.usuario, required this.historias});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        itemCount: 1 + historias.length,
        itemBuilder: (context, indice) {
          if (indice == 0) {
            Historia historiaUsuario = Historia(
              usuario: usuarioAtual,
              urlImage: usuarioAtual.urlImage,
            );

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: CartaoHistoria(
                adicionarHistoria: true,
                historia: historiaUsuario,
              ),
            );
          }

          Historia historia = historias[indice - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CartaoHistoria(historia: historia),
          );
        },
      ),
    );
  }
}

class CartaoHistoria extends StatelessWidget {
  final Historia historia;
  final bool adicionarHistoria;
  const CartaoHistoria(
      {super.key, required this.historia, this.adicionarHistoria = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: historia.urlImage,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: PaletaCores.degradeHistoria,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: adicionarHistoria
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    color: PaletaCores.blueFacebook,
                    iconSize: 30,
                    onPressed: () {},
                  ),
                )
              : ImagemPerfil(
                  urlImage: historia.usuario.urlImage,
                  foiVisualizado: historia.foiVisualizado,
                ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child:  Text(
            adicionarHistoria ? "Criar Story" :
            historia.usuario.username,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
