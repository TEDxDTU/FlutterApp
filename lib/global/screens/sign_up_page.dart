import 'package:flutter/material.dart';
import 'package:ted_app/designs/input_textfield_design.dart';

class sign_up_details extends StatefulWidget {
  const sign_up_details({Key? key}) : super(key: key);

  @override
  _sign_up_detailsState createState() => _sign_up_detailsState();
}

class _sign_up_detailsState extends State<sign_up_details> {
  late String? name , email , phone;
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            //height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Form(
               key: _formKey,
               child: Column(
                 children:  [
                  const Padding(
                     padding:  EdgeInsets.only(top: 20, right: 160),
                     child: SizedBox(
                       height: 80,
                       width: 200,
                       child: Image(image: AssetImage('images/TedxDtu_Logo.png')),
                     ),
                   ),
                   const SizedBox(
                     height: 50,
                   ),
                  const Padding(
                     padding: EdgeInsets.only(left: 10),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: SizedBox(
                         child:  Text('Create Account' , style: TextStyle(fontSize: 28 , color: Colors.white , fontWeight: FontWeight.w400),),
                       ),
                     ),
                   ),
                  const Padding(
                     padding: EdgeInsets.only(left: 10 , top: 30),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: SizedBox(
                         child:  Text('Name' , style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.w300),),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10 , top: 10),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: SizedBox(
                         height: 50,
                         width: 300,
                         child: TextFormField(
                           style: TextStyle(color: Colors.white),
                           keyboardType: TextInputType.text,
                           decoration: buildInputDecoration(Icons.person , 'Full Name'),
                           validator: (String? value){
                             if(value!.isEmpty)
                             {
                               return 'Please Enter Name';
                             }
                             return null;
                           },
                           onSaved: (String? value){
                             name = value;
                           },
                         ),
                       ),
                     ),
                   ),
                   const Padding(
                     padding: EdgeInsets.only(left: 10 , top: 10),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: SizedBox(
                         child:  Text('Mobile' , style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.w300),),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10 , top: 10),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: SizedBox(
                         height: 50,
                         width: 300,
                         child: TextFormField(
                           style: TextStyle(color: Colors.white),
                           keyboardType: TextInputType.name,
                           decoration: buildInputDecoration(Icons.phone , "Phone Number"),
                           validator: (String? value){
                             if(value!.isEmpty)
                             {
                               return 'Please enter phone no ';
                             }
                             else if(value.length<9)
                               {
                                 return 'Please enter valid phone Number';
                               }
                             return null;
                           },
                           onSaved: (String? value){
                             phone = value;
                           },
                         ),
                       ),
                     ),
                   ),
                   const Padding(
                     padding: EdgeInsets.only(left: 10 , top: 10),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: SizedBox(
                         child:  Text('University' , style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.w300),),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10 , top: 10),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: SizedBox(
                         height: 50,
                         width: 300,
                         child: TextFormField(
                           style: TextStyle(color: Colors.white),
                           keyboardType: TextInputType.text,
                           decoration: buildInputDecoration(Icons.business , "University"),
                           validator: (String? value){
                             if(value!.isEmpty)
                             {
                               return 'Please Enter Your University Name';
                             }
                             return null;
                           },
                           onSaved: (String? value){
                             name = value;
                           },
                         ),
                       ),
                     ),
                   ),
                   const Padding(
                     padding: EdgeInsets.only(left: 10 , top: 10),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: SizedBox(
                         child:  Text('Email' , style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.w300),),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10 , top: 10),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: SizedBox(
                         height: 50,
                         width: 300,
                         child: TextFormField(
                           style: TextStyle(color: Colors.white),
                           keyboardType: TextInputType.name,
                           decoration: buildInputDecoration(Icons.email , "Email"),
                           validator: (String? value){
                             if(value!.isEmpty)
                             {
                               return 'Please Enter Email';
                             }
                             if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                               return 'Please a valid Email';
                             }
                             return null;
                           },
                           onSaved: (String? value){
                             email = value;
                           },
                         ),
                       ),
                     ),
                   ),
                   const Padding(
                     padding: EdgeInsets.only(left: 10 , top: 10),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: SizedBox(
                         child:  Text('Password' , style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.w300),),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10 , top: 10),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: SizedBox(
                         height: 50,
                         width: 300,
                         child: TextFormField(
                           style: TextStyle(color: Colors.white),
                           keyboardType: TextInputType.name,
                           decoration: buildInputDecoration(Icons.lock , "Password"),
                           validator: (String? value)
                           {
                             if(value!.isEmpty)
                               {
                                 return 'Please Enter Password';
                               }
                             else if(value.length<8)
                               {
                                 return 'Password size is weak';
                               }
                             return null;
                           },
                         ),
                       ),
                     ),
                   ),
                   const Padding(
                     padding: EdgeInsets.only(left: 10 , top: 10),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: SizedBox(
                         child:  Text('Confirm Password' , style: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.w300),),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10 , top: 10),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: SizedBox(
                         height: 50,
                         width: 300,
                         child: TextFormField(
                           style: TextStyle(color: Colors.white),
                           keyboardType: TextInputType.name,
                           decoration: buildInputDecoration(Icons.lock , "Confirm Password"),
                           validator: (String? value)
                           {
                             if(value!.isEmpty)
                               {
                                 return 'Please re-enter password';
                               }
                             if(password.text!=confirmpassword.text)
                               {
                                 return "Password does not match";
                               }
                             return null;
                           },
                         ),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right: 10 , top: 30 , bottom: 30),
                     child: Align(
                       alignment: Alignment.topRight,
                       child: SizedBox(
                         height: 50,
                         width: 110,
                         child: ElevatedButton(
                           onPressed: () {

                             if(_formKey.currentState!.validate())
                               {
                                 Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                               }

                           },
                           style: ElevatedButton.styleFrom(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(20),
                             ),
                             onPrimary: Colors.white,
                             primary: Colors.red,
                             elevation: 4
                           ),
                           child: const Text('Sign Up' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
            ),
          ),
      ),
    );
  }
}
