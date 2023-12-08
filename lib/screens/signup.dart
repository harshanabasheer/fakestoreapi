import 'package:flutter/material.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {

  TextEditingController _nameController=TextEditingController();
  TextEditingController _addressController=TextEditingController();
  TextEditingController _phoneController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  final _formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration:BoxDecoration(
          // image: DecorationImage(
          //     image: AssetImage("images/background.jpg"),fit: BoxFit.cover
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key:_formKey ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Text("Signup",style: TextStyle(fontSize: 30,color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                  SizedBox(height: 50,),
                  Padding(
                      padding: const EdgeInsets.only(left:20.0,right: 20),
                      child:
                      TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: "Name",
                        ),
                      )
                  ),
                  SizedBox(height: 10,),
                  Padding(
                      padding: const EdgeInsets.only(left:20,right: 20),
                      child:
                      TextFormField(
                        controller: _addressController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Address is required';
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: "Address",
                        ),
                      )
                  ),
                  SizedBox(height: 10,),
                  Padding(
                      padding: const EdgeInsets.only(left:20.0,right: 20),
                      child:
                      TextFormField(
                        controller: _phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone is required';
                          }
                          RegExp number=new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                          if(number.hasMatch(value)){
                            return null;
                          }else{
                            return 'Invalid Mobile number';
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: "Phone",
                        ),
                      )
                  ),
                  SizedBox(height: 10,),
                  Padding(
                      padding: const EdgeInsets.only(left:20.0,right: 20),
                      child: // Note: Same code is applied for the TextFormField as well
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: "Email",
                          // prefixIcon: Icon(Icons.email_outlined),

                        ),
                      )
                  ),
                  SizedBox(height: 10,),
                  Padding(
                      padding: const EdgeInsets.only(left:20.0,right: 20),
                      child: // Note: Same code is applied for the TextFormField as well
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                        },
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
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0,right: 20),
                    child: ElevatedButton(onPressed: (){
                      // registerUser(context: context, name: _nameController.text, address: _addressController.text,
                      //     dateofbirth: _dateController.text, phone: _phoneController.text,
                      //     email: _emailController.text, password: _passwordController.text);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown,minimumSize: const Size.fromHeight(50), //
                        shape: StadiumBorder(),
                      ),
                      child: const Text('SignUp', style: TextStyle(fontSize: 15,color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
