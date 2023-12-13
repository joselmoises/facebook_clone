import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/Components/image_perfil.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:facebook_interface/utils/Paletas_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CartaoPostagem extends StatelessWidget {
  final Postagem postagem;

  const CartaoPostagem({super.key, required this.postagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          //Cabecalho
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CabecalhoPostagem(postagem: postagem),
                Text(postagem.descricao),
              ],
            ),
          ),

          //Imagem Post
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CachedNetworkImage(imageUrl: postagem.urlImagem),
          ),

          //Area Estatistica
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: EstatisticaPostagem(postagem: postagem),
          ),
        ],
      ),
    );
  }
}

class EstatisticaPostagem extends StatelessWidget {
  final Postagem postagem;

  const EstatisticaPostagem({
    super.key,
    required this.postagem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                  color: PaletaCores.blueFacebook, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                "${postagem.curtidas} curtidas",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            Text(
              "${postagem.comentarios} comentarios",
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "${postagem.compartilhamentos} compartilhamentos",
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1.2,
        ),
        Row(
          children: [
            BotaoPostagem(
              icon: Icon(
                LineIcons.thumbsUpAlt,
                color: Colors.grey[700],
              ),
              nome: "Curtir",
              onPressed: () {},
            ),
            BotaoPostagem(
              icon: Icon(
                LineIcons.alternateCommentAlt,
                color: Colors.grey[700],
              ),
              nome: "Comentar",
              onPressed: () {},
            ),
            BotaoPostagem(
              icon: Icon(
                LineIcons.share,
                color: Colors.grey[700],
              ),
              nome: "Compartilhar",
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class BotaoPostagem extends StatelessWidget {
  final Icon icon;
  final String nome;
  final VoidCallback onPressed;

  const BotaoPostagem(
      {super.key,
      required this.icon,
      required this.nome,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: () {},
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Row(
              children: [
                icon,
                const SizedBox(
                  width: 4,
                ),
                Text(
                  nome,
                  style: TextStyle(
                      color: Colors.grey[700], fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CabecalhoPostagem extends StatelessWidget {
  final Postagem postagem;

  const CabecalhoPostagem({
    super.key,
    required this.postagem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagemPerfil(
          urlImage: postagem.usuario.urlImage,
          foiVisualizado: true,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                postagem.usuario.username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text("${postagem.tempoAtras} - "),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
