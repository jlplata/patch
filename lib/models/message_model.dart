import 'package:patchbetav1/models/user_model_grp.dart';

class Message {
  final Users sender;
 // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
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
final Users viki = Users(
  id: 2,
  name: 'Cortes Conzalez Lesly Victoria',
  imageUrl: 'assets/images/Cortes Conzalez Lesly Victoria.jpg',
);
final Users romario = Users(
  id: 3,
  name: 'Davila Pequeño Romario',
  imageUrl: 'assets/images/Davila Pequeño Romario.jpg',
);
final Users matias = Users(
  id: 4,
  name: 'De la Rosa Ramirez Alejandro Matias',
  imageUrl: 'assets/images/De la Rosa Ramirez Alejandro Matias.jpg',
);
final Users kike = Users(
  id: 5,
  name: 'Enriquez Lazcano Oscar Mario',
  imageUrl: 'assets/images/Enriquez Lazcano Oscar Mario.jpg',
);
final Users maiin = Users(
  id: 6,
  name: 'Escalona Garza Jose Luis Margarito',
  imageUrl: 'assets/images/Escalona Garza Jose Luis Margarito.jpg',
);
final Users davidA = Users(
  id: 7,
  name: 'Garza Garcia David Alejandro',
  imageUrl: 'assets/images/Garza Garcia David Alejandro.jpg',
);
final Users hipolito = Users(
  id: 8,
  name: 'Hipolito Martinez Marco Antonio',
  imageUrl: 'assets/images/Hipolito Martinez Marco Antonio.jpg',
);
final Users dario = Users(
  id: 9,
  name: 'Lopez Estrada Dario Alfonso',
  imageUrl: 'assets/images/Lopez Estrada Dario Alfonso.jpg',
);
final Users maleny = Users(
  id: 10,
  name: 'Lopez Perez Maleny Lizbeth',
  imageUrl: 'assets/images/Lopez Perez Maleny Lizbeth.jpg',
);
final Users kalifa = Users(
  id: 11,
  name: 'Mejorado Briseño Alexis Daniel',
  imageUrl: 'assets/images/Mejorado Briseño Alexis Daniel.jpg',
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
final Users allan = Users(
  id: 15,
  name: 'Sandoval Villanueva Alan Mauricio',
  imageUrl: 'assets/images/Sandoval Villanueva Alan Mauricio.jpg',
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

// FAVORITE CONTACTS
List<Users> favorites = [charles, viki, romario, matias, kike, maiin, davidA, hipolito, dario, kalifa, chope, plata, chuy, allan, rona, adolfo];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: charles,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: viki,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: romario,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: matias,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: kike,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: maiin,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: davidA,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: hipolito,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: dario,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: kalifa,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: chope,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: plata,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: chuy,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: allan,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: rona,
    text: 'Alumno de ISIC',
  ),
  Message(
    sender: adolfo,
    text: 'Alumno de ISIC',
  ),
];