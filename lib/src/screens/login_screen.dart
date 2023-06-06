import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginScreen extends StatefulWidget {
  createState(){
    return LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen>{

  final formkey = GlobalKey<FormState>();
    String username='';
  String password = "";


  Widget build(context){
     return Container(
      margin: EdgeInsets.fromLTRB(20,30,20,30),
      padding: EdgeInsets.fromLTRB(20,30,20,30),
      child:Form(
        key:formkey,
        child: Column(
        children:[
          
          
          Center(child: Text("Login Form"),
                  
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(   
    labelText: 'Enter Name',  
    hintText: 'ayush@hyperlab'  
          ),
          validator:  (value) {
              if (value!.length<6) {
                return 'Please enter emailAddress with length greater than 6';
              }
              return null;
            },
             onSaved:  (value) {
                 username = value!;
            },

          ),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(   
    labelText: 'Enter Password',  
    hintText: 'xbsik1279dns'  
          ),
           validator:  (value) {
              if (!value!.contains('@')) {
                return 'Please enter valid password';
              }
              return null;
            },
            onSaved:  (value) {
                  password = value!;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){

                
              
              if(formkey.currentState!.validate()){
                    formkey.currentState!.save();
                    print('$username  $password');
                    
                    
              }
              Navigator.push(context,MaterialPageRoute(builder: (context) => SecondRoute(username: username,)));
              
              
            },
             child: Text("Submit",
             style:TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.abel().fontFamily,
            
             )),
             style:ElevatedButton.styleFrom(
              backgroundColor: Colors.green[300],
                
             )
             ),
          )
        ]
      ),
      )

     );
  }
}


class SecondRoute extends StatelessWidget{
  const SecondRoute({Key? key, required this.username}) : super(key: key);

  final String username;
 Widget build(context){
   return MaterialApp(
    home:Scaffold(
       body:Center(
         child: Padding(
           padding: const EdgeInsets.only(top:100.0),
           child: Column(
            children: [
              Text("Hi $username"),
              Text("Welcome to Hyperlabs"),
              ElevatedButton(onPressed: () {  
           Navigator.pop(context);  
         }  ,
               child: Text("Log Out"),
               
               )
         
            ],
           ),
         ),
       )
    )
  );
 }
}

