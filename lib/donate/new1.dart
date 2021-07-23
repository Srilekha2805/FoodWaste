
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_waste/authentication.dart';

FirebaseAuth _auth=FirebaseAuth.instance;
User firebaseUser=_auth.currentUser;

class Quantity extends StatefulWidget {
  String type;
  Quantity(this.type);
  @override
  _QuantityState createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  String itemName,qty,date;
  DateTime _date = new DateTime.now();
  TimeOfDay _time=new TimeOfDay.now();
  DonateService _donateService=new DonateService();
  Future<Null> _selectDate(BuildContext context) async{
    final DateTime picked=await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2021),
        lastDate:new DateTime(2030)
    );

    if(picked!=null && picked!=_date)
      {
        setState(() {
          _date=picked;
        });
      }
  }

  Future<Null> _selectTime(BuildContext context) async{
    final TimeOfDay picked=await showTimePicker(
        context: context,
        initialTime: _time);
    if(picked!=null && picked!=_time)
    {
      setState(() {
        _time=picked;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        shape: ContinuousRectangleBorder(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(90.0),
            bottomRight: Radius.circular(90.0),
          ),),
        title: Text("Donate",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Make your contribution',
                textAlign: TextAlign.center,
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                onChanged: (val) {
                  itemName = val; //get the value entered by user.
                },
                decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                validator: (val) => val.isEmpty
                    ? "Required"
                    : null,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (val) {
                  qty = val; //get the value entered by user.
                },
                decoration: InputDecoration(
                    hintText: "Quantity",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                validator: (val) => val.isEmpty
                    ? "Required"
                    : null,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                onTap: (){
                  FocusScope.of(context).requestFocus(new FocusNode());
                  _selectDate(context);
                },
                decoration: InputDecoration(
                    hintText: "Day of Preparation",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                validator: (val) => val.isEmpty
                    ? "Required"
                    : null,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                onTap: (){
                  FocusScope.of(context).requestFocus(new FocusNode());
                  _selectTime(context);
                },

                decoration: InputDecoration(
                    hintText: "Time of Preparation",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                validator: (val) => val.isEmpty
                    ? "Required"
                    : null,
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
                      _donateService.donate(firebaseUser,itemName,widget.type, qty,_date,_time)!=null?
                      Text("Donation successful"):Text("Unsuccessful");
                    },
                    child: Text(
                      'Donate',
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



