import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:patchbetav1/models/user_data.dart';
import 'package:patchbetav1/screen/bloqueados.dart';
import 'package:patchbetav1/screen/conectados.dart';
import 'package:patchbetav1/screen/grupos.dart';
import 'package:patchbetav1/screen/mensajes.dart';
import 'package:patchbetav1/screen/profile_screen%20copy.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 2;
  final Grupos _grupo = Grupos();
  final ChatScreen _mensajes = ChatScreen();
  final Conectados _conectados = Conectados();
  final Bloqueados _bloqueados = Bloqueados();

  Widget _showPage = new ChatScreen();

  Widget _checkedPage(int page)
  {
    switch (page) {
      case 0:
        return ProfileScreenPruebas(userId: Provider.of<UserData>(context).currentUserId);
        break;
      case 1:
        return _grupo;
        break;
      case 2:
        return _mensajes;
        break;
      case 3:
        return _conectados;
        break;
      case 4:
        return _bloqueados;
        break;
        default:
        return new Container(
          child: new Center(
            child: new Text('No has seleccionado nada'), 
          ),
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Barra de arriba
   
      
      //bODY DE LA APP
         body: Container(
          color: Colors.white,
          child: Center(
            child: _showPage,
          ),
        ),


//el bottom de la app
        bottomNavigationBar: CurvedNavigationBar(
          index: pageIndex,
          height: 70.0,
          items: <Widget>[
            Icon(Icons.perm_identity, size: 22, color: Colors.white),
            Icon(Icons.list, size: 22,color: Colors.white),
            Icon(Icons.message, size: 22,color: Colors.white),
            Icon(Icons.wifi_tethering, size: 22,color: Colors.white),
            Icon(Icons.portable_wifi_off, size: 22,color: Colors.white),
            
          ],
          color: Color(0xFF1E2122),
          buttonBackgroundColor: Color(0xFF1E2122),
          backgroundColor:  Colors.white,
          animationCurve: Curves.easeInOut,
          
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tapindex) {
            setState(() {
              _showPage = _checkedPage(tapindex);
            });
          },
        ),
     
        );
  }
}