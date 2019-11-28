import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Patch/models/CardItemModel.dart';
import 'package:Patch/models/user_model.dart';
import 'package:Patch/service/auth_service.dart';
import 'package:Patch/utils/constants.dart';

import 'edit_profile_screen.dart';

class ProfileScreenPruebas extends StatefulWidget {
  final String userId;

  ProfileScreenPruebas({this.userId});

  @override
  _ProfileScreenPruebasState createState() => _ProfileScreenPruebasState();
}

class _ProfileScreenPruebasState extends State<ProfileScreenPruebas> with TickerProviderStateMixin{

  var appColors = [Color.fromRGBO(231, 129, 109, 1.0),Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(111, 194, 173, 1.0)];
  var cardIndex = 0;
  ScrollController scrollController;
  var currentColor = Color.fromRGBO(231, 129, 109, 1.0);

  var cardsList = [CardItemModel("Personal", Icons.account_circle, 9, 0.83),CardItemModel("Prog. Web", Icons.work, 12, 0.24),CardItemModel("Sist. Prog.", Icons.home, 7, 0.32)];

  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();

  }

  DateTime _selectdate = new DateTime.now();
  @override
  Widget build(BuildContext context) {
    final DateFormat df = new DateFormat("dd/MM/yyyy");
    return Scaffold(
      backgroundColor: Color(0xFF1E2122),
      appBar: new AppBar(
       
        title: new Text("Perfil",),
        backgroundColor: Color(0xFF1E2122),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app,
              color: Colors.white),
              onPressed: () => AuthService.cerrarSesion(context),),
          
                 
        ],
        elevation: 0.0,
      ),



      body: Container(
        decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
        child: FutureBuilder(
          
          future: usersRef.document(widget.userId).get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            User user = User.fromDoc(snapshot.data);

            return ListView(
              children: <Widget>[
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 120 ,vertical: 10.0),
                        child: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.grey,
                        backgroundImage: user.profileImageUrl.isEmpty
                            ? AssetImage('assets/images/user_placeholder.jpg')
                            : CachedNetworkImageProvider(user.profileImageUrl),
                      ),
                      ),
                      Container(
                        child: FlatButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EditProfileScreen(
                                    user: user,
                                  ),
                                ),
                              ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(60.0,16.0,5.0,12.0),
                              child: Text("Hola, "+ user.name , style: TextStyle(fontSize: 30.0, color: Color(0xFF1E2122), fontWeight: FontWeight.w400),),
                            ),
                            Icon(Icons.edit),
                          ],
                        ),
                        ),
                      ),
                      Text(user.bio, style: TextStyle(color: Color(0xFF1E2122),),),
                    ],
                  ),
                ),
              ),Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 130.0, vertical: 16.0),
                    child: Text("Hoy "+ df.format(_selectdate), style: TextStyle(color: Color(0xFF1E2122)),),
                  ),
                  Container(
                    height: 350.0,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, position) {
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Color(0xFF1E2122),
                              child: Container(
                                width: 250.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Icon(cardsList[position].icon, color: appColors[position],),
                                          Icon(Icons.more_vert, color: Colors.white,),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            child: Text("${cardsList[position].tasksRemaining} Tareas", style: TextStyle(color: Colors.white),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            child: Text("${cardsList[position].cardTitle}", style: TextStyle(fontSize: 28.0, color: Colors.white),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: LinearProgressIndicator(value: cardsList[position].taskCompletion,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                            ),
                          ),
                          onHorizontalDragEnd: (details) {

                            animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
                            curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
                            animationController.addListener(() {
                              setState(() {
                                currentColor = colorTween.evaluate(curvedAnimation);
                              });
                            });

                            if(details.velocity.pixelsPerSecond.dx > 0) {
                              if(cardIndex>0) {
                                cardIndex--;
                                colorTween = ColorTween(begin:currentColor,end:appColors[cardIndex]);
                              }
                            }else {
                              if(cardIndex<2) {
                                cardIndex++;
                                colorTween = ColorTween(begin: currentColor,
                                    end: appColors[cardIndex]);
                              }
                            }
                            setState(() {
                              scrollController.animateTo((cardIndex)*256.0, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                            });

                            colorTween.animate(curvedAnimation);

                            animationController.forward( );

                          },
                        );
                      },
                    ),
                  ),
                ],
              )
               
              ],
            );
          },
          
        ),
      ),
     
    );
  }
}
