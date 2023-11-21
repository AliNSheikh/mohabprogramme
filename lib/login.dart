import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohab/Home.dart';
import 'package:mohab/statemange/appstates.dart';
import 'package:mohab/statemange/cubit.dart';

import 'animation/animation.dart';

class loginscreen extends StatelessWidget {


  @override
  var passcon = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool loading=false;
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit,appstates>(
      listener:( context,  state){
        if(state is loginsuccstate){
          Navigator.of(context).pushAndRemoveUntil(AnimationsRoutefade(
              page: home()
          ), (route) => false);
        }

        if(state is loginerrorstate){
          AwesomeDialog(
            context: context,
            //dialogType: DialogType.error,
            customHeader: Icon(
              Icons.error,
              size: 50.0,
              color: Colors.red,
            ),
            animType: AnimType.scale,
            headerAnimationLoop: false,
            title: "Error",
            desc: "Password is not correct",
            btnOkOnPress: (){},
            btnOkColor: Colors.red,
            width: MediaQuery.of(context).size.width*0.25,

          ).show();
        }
      } ,
      builder: ( context,  state) {
        return  Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF00c9a7),
                    Color(0xFFc4fcef),
                    Color(0xFF4d8076),
                  ],
                ),
              ),
              child:Form(
                key:formkey ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedTextKit(animatedTexts: [
                      ColorizeAnimatedText("Input Password",
                          textStyle: TextStyle(fontSize: 50,),
                          colors: [
                            Color(0xFFff9671),
                            Color(0xFFffc75f),
                            Color(0xFFf9f871),
                          ]),
                    ]),
                    SizedBox(height: 30.0,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      child: TextFormField(
                        controller: passcon,
                        validator: (String? value){
                          if (value!.length<5){
                            return 'password short and error';
                          }else{
                            return null;
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: appcubit.get(context).ispass,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(appcubit.get(context).suffix),
                            onPressed: () {
                              appcubit.get(context).changeicon();
                            },
                          ),
                          hintText: "Enter Your Password",
                          label: Text('Password'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    ConditionalBuilder(
                      condition:state is! loginloadstate,
                      builder:(context)=>  Container(
                        width: MediaQuery.of(context).size.width*0.25,
                        height: MediaQuery.of(context).size.height*0.1,
                        padding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 60,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: MaterialButton(
                          onPressed: ()  {

                            if(formkey.currentState!.validate()) {
                              appcubit.get(context).login(pass: passcon.text);

                            };
                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              letterSpacing: 6.0,
                            ),
                          ),
                        ),
                      ),
                      fallback:(context)=>Center(child: CircularProgressIndicator(),),
                    ),

                  ],
                ),
              )
          ),
        );
      },

    );
  }
}
