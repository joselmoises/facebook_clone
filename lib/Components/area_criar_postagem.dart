import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/models/usuario.dart';
import 'package:flutter/material.dart';

class AreaCriarPostagem extends StatelessWidget {

  final Usuario usuario;

  const AreaCriarPostagem({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.fromLTRB(12, 8, 12, 8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(usuario.urlImage),
              ),
              const SizedBox(
                width: 8,
              ),
              const Expanded(child: TextField( decoration: InputDecoration.collapsed(hintText: "No que esta pensando"),))
            ],
          ),
          const Divider(
            height: 10,
            thickness: 0.5,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(onPressed: (){}, icon: const Icon(Icons.videocam, color: Colors.red,), label: const Text("Ao vivo", style: TextStyle(color: Colors.black),),),
                const VerticalDivider(width: 8,),
                TextButton.icon(onPressed: (){}, icon: const Icon(Icons.photo_library, color: Colors.green,), label: const Text("Foto", style: TextStyle(color: Colors.black),),),
                const VerticalDivider(width: 8,),
                TextButton.icon(onPressed: (){}, icon: const Icon(Icons.video_call, color: Colors.purple,), label: const Text("Sala", style: TextStyle(color: Colors.black),),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
