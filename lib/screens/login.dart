import 'package:fakestoreapi/screens/home.dart';
import 'package:fakestoreapi/screens/listview.dart';
import 'package:fakestoreapi/screens/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();


  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration:BoxDecoration(
          // color:Colors.lightBlueAccent
          // image: DecorationImage(
          //     image: AssetImage("images/background.jpeg"),fit: BoxFit.cover
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login",style: TextStyle(fontSize: 30,color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
              SizedBox(height: 50,),
              Padding(
                  padding: const EdgeInsets.only(left:20.0,right: 20),
                  child:TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: "User Name",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  )
              ),
              SizedBox(height: 20,),
              Padding(
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password),
                    ),

                  )
              ),
              SizedBox(height: 20,),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20),
                child: ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductGrid()));
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CategoriesPage()));
                },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,minimumSize: const Size.fromHeight(50), //
                    shape: StadiumBorder(),
                  ),
                  child: const Text('Login', style: TextStyle(fontSize: 15,color: Colors.white),),
                ),
              ),
              // SizedBox(height: 5,),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> UserSignUp()));
                },
                child: Align(
                  alignment: Alignment.bottomRight,
                    child: Text('Dont have an account?', style: TextStyle(fontSize: 15,color: Colors.black))),
              ),


            ],
          ),
        ),
      ),

    );
  }
}
