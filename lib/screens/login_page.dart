import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_color_constants.dart';
import '../services/auth.dart';


enum FormStatus{signIn,register}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  FormStatus _formStatus=FormStatus.signIn;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     resizeToAvoidBottomInset: false,
     backgroundColor: AppColorConstants.white,
     body: Center(
       child: Column(
         children: [
           SafeArea(
             child: Padding(
               padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   ClipRRect(
                     borderRadius: BorderRadius.circular(15),
                     child: Container(
                       height: 391,
                       width: 400,
                       color: AppColorConstants.black12,
                       child: Form(
                         child: _formStatus==FormStatus.signIn? buildSignIn():buildRegister(),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),
           Image.asset('images/home.gif',height: 350),
         ],

       ),
     ),
   );
  }




  Widget buildSignIn() {

      final GlobalKey<FormState> _signInFormkey=GlobalKey<FormState>();
    TextEditingController _emailController=TextEditingController();
    TextEditingController _passwordController=TextEditingController();
    return Padding(
        padding: EdgeInsets.all(10),
      child: ClipRect(
        child: Form(
        key: _signInFormkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              validator: (val){
                if(!EmailValidator.validate(val!)){return 'Please enter a valid email address';}
                else{
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'E-mail',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),),
            SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              validator: (value){
                if(value!.length<6){return 'Your password must be at least 6 characters';}
                else{
                  return null;
                }
              },
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all<Color?>(AppColorConstants.teal_shade800)) ,
                onPressed: () {
                  print(_signInFormkey.currentState!.validate());


                }, child: Text('LOGIN')),
            TextButton(
                onPressed: () {
                  setState(() {
                    _formStatus=FormStatus.register;
                  });
                }, child: Text('Create an Account',
                style: TextStyle(color:AppColorConstants.teal_shade700))),
          ],
        ),
      ),
      ),);

  }




  Widget buildRegister() {

     final GlobalKey<FormState> _registerFormKey=GlobalKey<FormState>();
    TextEditingController _emailController1=TextEditingController();
    TextEditingController _passwordController1=TextEditingController();
    TextEditingController _passwordConfirmController=TextEditingController();
    return Padding(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            TextFormField(
              controller: _emailController1,
              validator: (text){
                if(!EmailValidator.validate(text!)){return 'Please enter a valid email address';}
                else{
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'E-mail',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),),
            SizedBox(height: 5),
            TextFormField(
              controller: _passwordController1,
              validator: (txt){
                if(txt!.length<6){return 'Your password must be at least 6 characters';}
                else{
                  return null;
                }
              },
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),),
            SizedBox(height: 5),
            TextFormField(
              controller: _passwordConfirmController,
              validator: (value){
                if(value!=_passwordController1.text){return 'Passwords do not match';}
                else{
                  return null;
                }
              },
              obscureText: true,
              decoration: InputDecoration(hintText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),),
            SizedBox(height: 12),
            ElevatedButton(
                onPressed: () async{
                  if(_registerFormKey.currentState!.validate()){
                    final user=await Provider.of<Auth>(context,listen: false).createUserWithEmailandPassword(
                        _emailController1.text, _passwordController1.text);
                    print(user!.uid);
                  };
                }, child: Text('REGISTER'),
                   style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all<Color?>(AppColorConstants.teal_shade800))),
            SizedBox(height: 5),
            TextButton(
                onPressed: ()  {
                  setState(() {
                    _formStatus=FormStatus.signIn;
                  });
                }, child: Text('Already have an Account? Login here',
                style: TextStyle(color:AppColorConstants.teal_shade700))),
          ],
        ),
      ),
    );
  }
}


