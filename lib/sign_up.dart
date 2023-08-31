import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:scholar/sign_in.dart';


class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();

}

class _registerState extends State<register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  bool _obsxureText = true;

  FirebaseAuth auth  = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    ProgressDialog dialog = ProgressDialog(context, title: Text("Registration..."), message: Text("please wait..."));
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white30, Colors.deepPurpleAccent]
                ),
                //color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22.0),bottomRight: Radius.circular(22.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Register New Account",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                  SizedBox(height: 12.0,),
                  Text("WellCome",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                ],
              ),

            ),
            SizedBox(height: 12.0,),
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
                          keyboardType: TextInputType.name,
                          controller: nameController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
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
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: contactController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              hintText: "Contact No",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                        SizedBox(height: 20.0,),

                      ],


                    ),


                  ),
                ),

              ),
            ),
            SizedBox(height: 15.0,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,

                ),
                onPressed: () async {
               dialog.show();
              UserCredential userCredential = await auth.createUserWithEmailAndPassword(
                  email: emailController.text.trim(), password: passwordController.text.trim());

              User? user  =  userCredential.user;

              if(user != null)
                {
                  dialog.dismiss();
                  ScaffoldMessenger.of(context).showSnackBar(

                    SnackBar(
                      backgroundColor: Colors.black,
                        content: Text("SignUp Success",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                  );
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));
                }
              else
                {
                  dialog.dismiss();
                  ScaffoldMessenger.of(context).showSnackBar(

                      SnackBar(
                          backgroundColor: Colors.black,
                          content: Text("SignUp Failed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                  );
                }

            },
                child: Text("Register",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),)),
            SizedBox(height: 30.0,),
            Column(
              children: [
                Text("Terms & Condition here ,Read Carefully"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
