import 'package:facebook_interface/models/modelos.dart';

class Historia {
  Usuario usuario;
  String urlImage;
  bool foiVisualizado;

  Historia({
    required this.usuario,
    required this.urlImage,
    this.foiVisualizado = false,
  });
}
