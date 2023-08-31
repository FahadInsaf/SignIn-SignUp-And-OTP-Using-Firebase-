import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:scholar/dashboard.dart';
import 'package:scholar/sign_up.dart';

class login extends StatefulWidget {

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obsxureText = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    ProgressDialog dailog = new ProgressDialog(context, title: Text("SignIn"), message: Text("please wait"));
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              width: MediaQuery.of(context).size.width,
              height:300.0,
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white30, Colors.deepPurpleAccent]
                ),
                //color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login",textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0,color:Colors.white,fontWeight: FontWeight.bold),),
                  SizedBox(height: 12.0,),
                  Text("Hello There",style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),),
                  SizedBox(height: 12.0,),
                  Text("WellCome Back",style: TextStyle(color: Colors.white,fontSize: 23.0,fontWeight: FontWeight.bold),),
                ],
              ),
            ) ,
            Container(
              padding: EdgeInsets.all(10.0),
              child: Card(
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.0,),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.home),
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon:  Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  setState((){
                                    _obsxureText = !_obsxureText;
                                  },
                                  );
                                },
                                child: Icon(_obsxureText?Icons.visibility : Icons.visibility_off),
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                          obscureText: _obsxureText,
                        ),

                        SizedBox(height: 20.0,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,

                          ),
                            onPressed: ()async{

                           dailog.show();
                         UserCredential userCredential = await auth.signInWithEmailAndPassword(
                             email: emailController.text.trim(),
                             password: passwordController.text.trim());

                         User? user = userCredential.user;

                         if(user != null)
                           {
                             dailog.dismiss();
                             ScaffoldMessenger.of(context).showSnackBar(

                                 SnackBar(
                                     backgroundColor: Colors.black,
                                     content: Text("SignIn Success",style: TextStyle(color: Colors.white,fontSize: 20.0),))
                             );
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>dashboardScreen()));
                           }
                         else
                           {
                             dailog.dismiss();
                             ScaffoldMessenger.of(context).showSnackBar(

                                 SnackBar(
                                     backgroundColor: Colors.black,
                                     content: Text("SignIn Failed",style: TextStyle(color: Colors.white,fontSize: 20.0),))
                             );
                           }

                        },
                            child: Text("Login",)),
                        SizedBox(height: 50.0,),
                        Text("Terms & Condition here, Read CareFully"),
                      ],


                    ),


                  ),
                ),

              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));
                },
                child: Column(
                  children: [
                    Text("Register New Account",style: TextStyle(color: Colors.black,fontSize: 15.0,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            )
          ],


        ),

      ),

    );
  }
}
