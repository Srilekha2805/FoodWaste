import 'package:flutter/material.dart';
import 'package:food_waste/authentication.dart';
import 'package:food_waste/initial.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name,email,ph,country,state,g,pwd;
  var _obscureText=true;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final snackBar = SnackBar(content: Text('Enter all details'));
  void submit()
  {
    if (_formKey.currentState.validate()) {
      register(email, pwd, name, ph, g).then((value) =>
          Navigator.push(context, MaterialPageRoute(builder:(context)=>Home())));
    } else {
      // ignore: deprecated_member_use
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[900],
          shape: ContinuousRectangleBorder(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(90.0),
              bottomLeft: Radius.circular(90.0),

            ),),
          title: Text("Signup",style: TextStyle(color: Colors.white),),
        ),
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'HELLO!',
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                    Text(
                      'Please Signup to Continue',
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      onChanged: (val) {
                        name = val; //get the value entered by user.
                      },
                      decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32.0)))),
                      style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      validator: (val) => val.isEmpty ? "*Required" : null,

                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (val) {
                        email = val; //get the value entered by user.
                      },
                      decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32.0)))),
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      validator: (val) => val.isEmpty || !val.contains("@")
                          ? "Enter a valid Email"
                          : null,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (val) {
                        pwd = val; //get the value entered by user.
                      },
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black45,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          hintText: "Password",

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32.0)))),
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      obscureText: _obscureText,
                      validator: (val) => val.isEmpty || val.length!=8
                          ? "Required and must be atleast 8 characters long"
                          : null,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (val) {
                        country = val; //get the value entered by user.
                      },
                      decoration: InputDecoration(
                          hintText: "Country",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32.0)))),
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      validator: (val) => val.isEmpty ? "*Required" : null,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (val) {
                        state= val; //get the value entered by user.
                      },
                      decoration: InputDecoration(
                          hintText: "State",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32.0)))),
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      validator: (val) => val.isEmpty ? "*Required" : null,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (val) {
                        ph= val; //get the value entered by user.
                      },
                      decoration: InputDecoration(
                          hintText: "Phone",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32.0)))),
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      validator: (val) => val.isEmpty ? "*Required" : null,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (val) {
                        g = val; //get the value entered by user.
                      },
                      decoration: InputDecoration(
                          hintText: "Gender",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32.0)))),
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      validator: (val) => val.isEmpty ? "*Required" : null,
                    ),
                    SizedBox(
                      height: 15,
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
                          onPressed: (){
                            submit();
                          },
                          child: Text(
                            'Signup',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          )),
                    )
                  ]),
            ),
          ),
        ),

      ),
    );
  }
}
