import 'package:modular_aula/app/modules/catalog/model/image_model.dart';

class CatalogStore {
  List<ImageModel> photos = [
    ImageModel(
        id: 1,
        title: "Jardim",
        url:
            "https://st2.depositphotos.com/1154952/5310/i/600/depositphotos_53106465-stock-photo-beautiful-morning-light-in-public.jpg"),
    ImageModel(
        id: 2,
        title: "Serra",
        url:
            "https://upload.wikimedia.org/wikipedia/commons/a/aa/Serra_do_Rio_do_Rastro_%28SC-390%29.jpg"),
    ImageModel(
        id: 3,
        title: ""
            "Mar",
        url:
            "https://static.escolakids.uol.com.br/conteudo_legenda/a7d81be3467084957ac91636dcd8ae68.jpg"),
  ];
}
