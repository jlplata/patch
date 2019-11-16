import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patchbetav1/models/Desconectar.dart';

class Bloqueados extends StatefulWidget {
  @override
  _BloqueadosState createState() => _BloqueadosState();
}

class _BloqueadosState extends State<Bloqueados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E2122),
      appBar: AppBar(
      actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search,
              color: Colors.white),
              onPressed: (){},),
                    
        ],
        title: Text(
          'Alumnos Bloqueados',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1E2122),
        
      ),


      body: Container(
        
        decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
        child: ClipRRect(
         
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
            
            itemCount: desconectar.length,
            itemBuilder: (BuildContext context, int index) {
              final Desconectar desconectados = desconectar [index];
              return Slidable(
                key: ValueKey(index),
                actionPane: SlidableDrawerActionPane(),
                
                
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Conectar',
                  color: Color(0xFF09723C),
                  icon: Icons.wifi_tethering,
                  onTap: () => _showSnackBar(context, 'Alumno Conectado'),
                ),
              ],
                        
                child: ListTile(
                  title: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 35.0,
                              backgroundImage: AssetImage(desconectados.sender.imageUrl),
                            ),
                            SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  desconectados.sender.name,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  child: Text(
                                    desconectados.text,
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  void _showSnackBar(BuildContext context, String text) 
  {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(text)
        )
      );
  }
}