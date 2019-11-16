
import 'package:patchbetav1/models/user_model_grp.dart';

class Desconectar {
  final UserD sender;
 // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Desconectar({
    this.sender,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final UserD currentUser = UserD(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
);

// USERD
final UserD charles = UserD(
  id: 1,
  name: 'Charles',
  imageUrl: 'assets/images/Charles Marin Eunice Estrella.jpg',
);
final UserD viki = UserD(
  id: 2,
  name: 'Cortes Conzalez Lesly Victoria',
  imageUrl: 'assets/images/Cortes Conzalez Lesly Victoria.jpg',
);
final UserD romario = UserD(
  id: 3,
  name: 'Davila Pequeño Romario',
  imageUrl: 'assets/images/Davila Pequeño Romario.jpg',
);
final UserD matias = UserD(
  id: 4,
  name: 'De la Rosa Ramirez Alejandro Matias',
  imageUrl: 'assets/images/De la Rosa Ramirez Alejandro Matias.jpg',
);
final UserD kike = UserD(
  id: 5,
  name: 'Enriquez Lazcano Oscar Mario',
  imageUrl: 'assets/images/Enriquez Lazcano Oscar Mario.jpg',
);
final UserD maiin = UserD(
  id: 6,
  name: 'Escalona Garza Jose Luis Margarito',
  imageUrl: 'assets/images/Escalona Garza Jose Luis Margarito.jpg',
);
final UserD davidA = UserD(
  id: 7,
  name: 'Garza Garcia David Alejandro',
  imageUrl: 'assets/images/Garza Garcia David Alejandro.jpg',
);
final UserD hipolito = UserD(
  id: 8,
  name: 'Hipolito Martinez Marco Antonio',
  imageUrl: 'assets/images/Hipolito Martinez Marco Antonio.jpg',
);
final UserD dario = UserD(
  id: 9,
  name: 'Lopez Estrada Dario Alfonso',
  imageUrl: 'assets/images/Lopez Estrada Dario Alfonso.jpg',
);
final UserD maleny = UserD(
  id: 10,
  name: 'Lopez Perez Maleny Lizbeth',
  imageUrl: 'assets/images/Lopez Perez Maleny Lizbeth.jpg',
);
final UserD kalifa = UserD(
  id: 11,
  name: 'Mejorado Briseño Alexis Daniel',
  imageUrl: 'assets/images/Mejorado Briseño Alexis Daniel.jpg',
);
final UserD chope = UserD(
  id: 12,
  name: 'Olvera Escalona Jose Luis',
  imageUrl: 'assets/images/Olvera Escalona Jose Luis.jpg',
);
final UserD plata = UserD(
  id: 13,
  name: 'Plata Santos Jose Luis',
  imageUrl: 'assets/images/Plata Santos Jose Luis.jpg',
);
final UserD chuy = UserD(
  id: 14,
  name: 'Rodriguez Oyervides Jesus Salvador',
  imageUrl: 'assets/images/Rodriguez Oyervides Jesus Salvador.jpg',
);
final UserD allan = UserD(
  id: 15,
  name: 'Sandoval Villanueva Alan Mauricio',
  imageUrl: 'assets/images/Sandoval Villanueva Alan Mauricio.jpg',
);
final UserD rona = UserD(
  id: 16,
  name: 'Valdez Alejandro Ronaldo',
  imageUrl: 'assets/images/Valdez Alejandro Ronaldo.jpg',
);
final UserD adolfo = UserD(
  id: 17,
  name: 'Viera Melendez Adolfo',
  imageUrl: 'assets/images/Viera Melendez Adolfo.png',
);

// FAVORITE CONTACTS
List<UserD> favorites = [charles, viki, romario, matias, kike, maiin, davidA, hipolito, dario, kalifa, chope, plata, chuy, allan, rona, adolfo];

// EXAMPLE CHATS ON HOME SCREEN
List<Desconectar> desconectar = [
  Desconectar(
    sender: charles,
    text: 'Alumno de ISIC',
  ),
  Desconectar(
    sender: viki,
    text: 'Alumno de ISIC',
  ),
  Desconectar(
    sender: romario,
    text: 'Alumno de ISIC',
  ),
  Desconectar(
    sender: matias,
    text: 'Alumno de ISIC',
  ),
  Desconectar(
    sender: kike,
    text: 'Alumno de ISIC',
  ),
  Desconectar(
    sender: davidA,
    text: 'Alumno de ISIC',
  ),
  Desconectar(
    sender: dario,
    text: 'Alumno de ISIC',
  ),
  Desconectar(
    sender: kalifa,
    text: 'Alumno de ISIC',
  ),
  Desconectar(
    sender: allan,
    text: 'Alumno de ISIC',
  ),
];