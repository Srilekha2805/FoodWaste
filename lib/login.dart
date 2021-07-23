import 'package:flutter/material.dart';
import 'package:food_waste/authentication.dart';
import 'clip.dart';
import 'home.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var _obscureText = false;
  String email,pwd;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final snackBar = SnackBar(content: Text('Enter all details'));

  void submit()
  {
    if (_formKey.currentState.validate()) {
      signIn(email, pwd)!=null?
          Navigator.push(context, MaterialPageRoute(builder:(context)=>Home())):print("failed");
    } else {
      // ignore: deprecated_member_use
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   elevation: 6.0,
      //   backgroundColor: Colors.pink[900],
      //   shape: ContinuousRectangleBorder(
      //     borderRadius: const BorderRadius.only(
      //       bottomLeft: Radius.circular(90.0),
      //       bottomRight: Radius.circular(90.0),
      //     ),),
      //   title: Text("Login",style: TextStyle(color: Colors.white),),
      // ),
      body: SingleChildScrollView(
        child: Form(
            key:_formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end:
                        Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
                        colors: <Color>[
                          Color(0xffc2185b),
                          Color(0xffad1457),
                        ], // red to yellow
                        tileMode: TileMode.mirror, // repeats the gradient over the canvas
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Welcome Back \n Login to Continue',
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    onChanged: (val) {
                      email = val; //get the value entered by user.
                    },
                    autocorrect: false,
                    decoration: InputDecoration(
                        hintText: "Email",
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(32.0)))
                    ),
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    validator: (val) => val.isEmpty || !val.contains("@")
                        ? "Enter a valid Email"
                        : null,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    onChanged: (val) {
                      pwd = val; //get the value entered by user.
                    },
                    autocorrect: false,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {

                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        hintText: "Password",

                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(32.0)))
                    ),
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    obscureText: _obscureText,
                    validator: (val) => val.isEmpty || val.length!=8
                        ? "Required and must be atleast 8 characters long"
                        : null,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  margin: EdgeInsets.all(40.0),
                  child: FlatButton(
                      color: Colors.pink[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      onPressed: () {
                         submit();
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      )),
                )
              ],
            ),
        ),
      ),
    );
  }
}
