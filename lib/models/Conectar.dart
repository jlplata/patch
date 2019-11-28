import 'package:Patch/models/user_model_grp.dart';

class Conectar {
  final Users sender;
 // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Conectar({
    this.sender,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final Users currentUser = Users(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
);

// USERS
final Users charles = Users(
  id: 1,
  name: 'Charles',
  imageUrl: 'assets/images/Charles Marin Eunice Estrella.jpg',
);
final Users maiin = Users(
  id: 6,
  name: 'Escalona Garza Jose Luis Margarito',
  imageUrl: 'assets/images/Escalona Garza Jose Luis Margarito.jpg',
);
final Users hipolito = Users(
  id: 8,
  name: 'Hipolito Martinez Marco Antonio',
  imageUrl: 'assets/images/Hipolito Martinez Marco Antonio.jpg',
);
final Users maleny = Users(
  id: 10,
  name: 'Lopez Perez Maleny Lizbeth',
  imageUrl: 'assets/images/Lopez Perez Maleny Lizbeth.jpg',
);
final Users chope = Users(
  id: 12,
  name: 'Olvera Escalona Jose Luis',
  imageUrl: 'assets/images/Olvera Escalona Jose Luis.jpg',
);
final Users plata = Users(
  id: 13,
  name: 'Plata Santos Jose Luis',
  imageUrl: 'assets/images/Plata Santos Jose Luis.jpg',
);
final Users chuy = Users(
  id: 14,
  name: 'Rodriguez Oyervides Jesus Salvador',
  imageUrl: 'assets/images/Rodriguez Oyervides Jesus Salvador.jpg',
);
final Users rona = Users(
  id: 16,
  name: 'Valdez Alejandro Ronaldo',
  imageUrl: 'assets/images/Valdez Alejandro Ronaldo.jpg',
);
final Users adolfo = Users(
  id: 17,
  name: 'Viera Melendez Adolfo',
  imageUrl: 'assets/images/Viera Melendez Adolfo.png',
);

// EXAMPLE CHATS ON HOME SCREEN
List<Conectar> conectado = [
  Conectar(
    sender: maiin,
    text: 'Alumno de ISIC',
  ),
  Conectar(
    sender: hipolito,
    text: 'Alumno de ISIC',
  ),
  Conectar(
    sender: chope,
    text: 'Alumno de ISIC',
  ),
  Conectar(
    sender: plata,
    text: 'Alumno de ISIC',
  ),
  Conectar(
    sender: chuy,
    text: 'Alumno de ISIC',
  ),
  Conectar(
    sender: rona,
    text: 'Alumno de ISIC',
  ),
  Conectar(
    sender: adolfo,
    text: 'Alumno de ISIC',
  ),
];
