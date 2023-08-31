import 'package:flutter/material.dart';
import 'package:scholar/phone.dart';
import 'package:scholar/sign_in.dart';

class select_option extends StatefulWidget {
  const select_option({Key? key}) : super(key: key);

  @override
  State<select_option> createState() => _select_optionState();
}

class _select_optionState extends State<select_option> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Select Option User verification",style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),
                    SizedBox(width: 10.0,),
                    Image.asset("images/verification_Image.png",color: Colors.deepPurpleAccent,width: 50,height: 50,fit: BoxFit.cover,),

                  ],
                ),
              ),
              SizedBox(height: 60.0,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(top: 13.0,bottom: 13.0,left: 45.0,right: 45.0),
                      primary: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () async{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                  },
                  child: Text("Verify On Email",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),)),

              SizedBox(height: 30.0,),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(top: 13.0,bottom: 13.0,left: 25.0,right: 25.0),
                      primary: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () async{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPhone()));
                  },
                  child: Text("Verify On Phone OTP",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),
    );
  }
}
