import 'package:facebook_interface/Components/area_criar_postagem.dart';
import 'package:facebook_interface/Components/area_historia.dart';
import 'package:facebook_interface/Components/botao_circulo.dart';
import 'package:facebook_interface/Components/cartao_postagem.dart';
import 'package:facebook_interface/dados/dados.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:facebook_interface/utils/Paletas_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            centerTitle: false,
            title: const Text(
              "facebook",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: PaletaCores.blueFacebook,
                fontSize: 28,
                letterSpacing: -1.2,
              ),
            ),
            actions: [
              BotaoCirculo(
                icone: Icons.search,
                iconeTamanho: 30,
                onPressed: () {},
              ),
              BotaoCirculo(
                icone: LineIcons.facebookMessenger,
                iconeTamanho: 30,
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: AreaCriarPostagem(
              usuario: usuarioAtual,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: AreaHistoria(
                usuario: usuarioAtual,
                historias: historias,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, indice) {
                Postagem postagem = postagens[indice];

                return CartaoPostagem(postagem: postagem);
              },
              childCount: postagens.length,
            ),
          ),
        ],
      ),
    );
  }
}
