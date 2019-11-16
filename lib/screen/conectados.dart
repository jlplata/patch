import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patchbetav1/models/Conectar.dart';

class Conectados extends StatefulWidget {
  @override
  _ConectadosState createState() => _ConectadosState();
}

class _ConectadosState extends State<Conectados> {
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
          'Alumnos Conectados',
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
            
            itemCount: conectado.length,
            itemBuilder: (BuildContext context, int index) {
              final Conectar conectados = conectado [index];
              return Slidable(
                key: ValueKey(index),
                actionPane: SlidableDrawerActionPane(),
                
                
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Bloqueado',
                  color: Color(0xFF8E1313),
                  icon: Icons.portable_wifi_off,
                  onTap: () => _showSnackBar(context, 'Alumno Bloqueado'),
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
                              backgroundImage: AssetImage(conectados.sender.imageUrl),
                            ),
                            SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  conectados.sender.name,
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
                                    conectados.text,
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