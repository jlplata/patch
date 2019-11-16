import 'package:flutter/material.dart';
import 'package:patchbetav1/screen/signup_screen.dart';
import 'package:patchbetav1/service/auth_service.dart';
import 'package:patchbetav1/utils/onBordingImageClipper.dart';

class LoginScreen extends StatefulWidget {

  static final String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final _formKey = GlobalKey<FormState>();
  String _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // Logging in the user w/ Firebase
      AuthService.login(_email, _password);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: OnBordingImageClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 500,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                        Positioned
                        (
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors:[
                                  Color(0xFF093C53).withOpacity(.8),
                                  Color(0xFF05440A).withOpacity(.05),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          bottom: 120,
                          width: 350,
                          height: 340,
                          child: Image.asset(
                            "assets/images/patchLogo.png"
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: -10,
                  child: Text(
                    "Iniciar Sesión",
                    style: TextStyle( 
                      fontSize: 40,
                      color: Color(0xFF093C53),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

              //Aqui va todo
            SizedBox(
              height: 20,
            ),



          Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    
                    Container(
                      width: double.infinity,
                      height: 58,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          color: Color(0xFFE7E7E7),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow:[
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(
                                0,4
                              ),
                            ),
                          ],
                        ),


                      child: Padding(
                        padding:  EdgeInsets.only(
                          top:4, left: 24, right: 16
                        ),
                        
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Correo',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                            ),
                            enabledBorder: InputBorder.none,
                            suffixIcon: Icon(Icons.person),
                          ),

                          validator: (input) => !input.contains('@') ? 'Por favor ingresa tu correo' : null,
                          onSaved: (input) => _email = input,
                          
                        ),
                      ),

                    ),



                    SizedBox(height: 10,),


                    Container(
                      width: double.infinity,
                      height: 58,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          color: Color(0xFFE7E7E7),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow:[
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(
                                0,4
                              ),
                            ),
                          ],
                        ),


                      child: Padding(
                        padding:  EdgeInsets.only(
                          top:4, left: 24, right: 16
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                            ),
                            enabledBorder: InputBorder.none,
                            suffixIcon: Icon(Icons.remove_red_eye),
                          ),

                          validator: (input) => input.length < 6 
                          ? 'Debe de tener maximo 6 caracteres' 
                          : null,
                          onSaved: (input) => _password = input,
                          obscureText: true,
                        ),
                      ),


                    ),



                    SizedBox(
                      height: 40.0,
                    ),



                    Container(
                      width: 150.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                        
                      ),
                        onPressed: _submit,
                        
                        color: Color(0xFF093C53),
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    
                    Container(
                      width: 150.0,
                      child: FlatButton(
                        onPressed: () => 
                            Navigator.pushNamed(context, SignupScreen.id),
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Registrarte',
                          style: TextStyle(
                            color: Color(0xFF093C53),
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),



            
          ],
        ),
      ),
    );
  }

 
}