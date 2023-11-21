import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohab/reusable.dart';
import 'package:mohab/statemange/appstates.dart';
import 'package:mohab/statemange/cubit.dart';
import 'package:mohab/update.dart';
import 'package:mohab/viewprofile.dart';
import 'package:wave_transition/wave_transition.dart';

import 'Home.dart';
import 'animation/animation.dart';
import 'model/empmod.dart';
enum ButtonAction{
  cancel,
  Agree,
}
class search extends StatelessWidget {
  TextEditingController searchcon=TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit,appstates>(
        listener: (context,state){},
      builder:(context,state){
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () async {
                  await appcubit.get(context).resetImage();
                  Navigator.of(context).pushAndRemoveUntil(AnimationsRoutertl(
                    page: home(),
                  ), (route) => false);
                  //navandfin(context, seller());
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.tealAccent,
                ),
              ),
              title: Text('بحث عن موظف'),
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.tealAccent,
                fontSize: 16.0,
                letterSpacing: 1.0,

              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    right: 18.0,

                  ),
                  child: Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Image.asset('logo.ico'),
                    foregroundDecoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.tealAccent,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(

              child: Container(

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formkey,
                        child: Container(
                          width: MediaQuery.of(context).size.width*.5,
                          child: TextFormField(
                            controller: searchcon,
                            textDirection: TextDirection.rtl,
                            validator: ( String? val){
                              if(val!.isEmpty){
                                return "يجب ادخال حرف واحد على الاقل";
                              }else{
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "أدخل اسم الموظف للبحث",
                                hintTextDirection: TextDirection.rtl,
                                prefixIcon:InkWell(
                                    onTap: () async {
                                      String mysearch=searchcon.text;
                                      if(formkey.currentState!.validate()){
                                        await appcubit.get(context).searchemp(name: mysearch);
                                        if(employ.length==0){
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
                                            title: "خطأ",
                                            desc: "تأكد من صحة البيانات المدخلة",
                                            btnOkOnPress: (){},
                                            btnOkColor: Colors.red,
                                            width: MediaQuery.of(context).size.width*0.25,

                                          ).show();
                                        }
                                      }

                                    },
                                    child: Icon(Icons.search, color: Colors.grey,))
                            ),
                            onFieldSubmitted: (value) async {
                              if(formkey.currentState!.validate()){
                                String mysearch=searchcon.text;
                                await appcubit.get(context).searchemp(name: mysearch);
                                if(employ.length==0){
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
                                    title: "خطأ",
                                    desc: "تأكد من صحة البيانات المدخلة",
                                    btnOkOnPress: (){},
                                    btnOkColor: Colors.red,
                                    width: MediaQuery.of(context).size.width*0.25,

                                  ).show();
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ),

                        ConditionalBuilder(
                      condition: state is! getempload,
                      builder: (context) => SizedBox(child:
                      test.length!=0 ? builditems(context,state)
                          :none(context), ),
                      fallback: (context) => Center(child: CircularProgressIndicator()),),
                  ],
                ),
              ),
            ),

          );
      },

    );
  }
  Widget buildgrid(employmodel model, BuildContext context, state) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.20,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Colors.white,
                Colors.white12,
                Colors.grey,
                //Colors.blue,
              ]),
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.3,
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage:
              model.url?.url != null
                  ? NetworkImage(model.url!.url!)
                  : NetworkImage(
                  "https://parsefiles.back4app.com/U8rcFinDY10JM7orIPJndK5kJVcU3T3haohLEU5a/2d5b27fd4fbcc4db3800e4289a07078d_profile.png"),


            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width*0.3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(

                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("${model.username}",
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(

                      height: 20.0,
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () async{
                                appcubit
                                    .get(context)
                                    .showMaterialDialog<ButtonAction>(
                                  context: context,
                                  child: AlertDialog(
                                    title: const Text(
                                        'سيتم حذف الموظف ونقله الى الارشيف !'),
                                    content: Text(
                                      'قم بتأكيد الامر',
                                    ),
                                    actions: <Widget>[
                                      InkWell(
                                        child: const Text('الغاء'),
                                        onTap: () {
                                          Navigator.pop(
                                              context, ButtonAction.cancel);
                                        },
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      InkWell(
                                        child: const Text('موافق'),
                                        splashColor: Colors.deepOrange,
                                        onTap: () async {
                                          Navigator.pop(
                                              context, ButtonAction.Agree);
                                          await appcubit
                                              .get(context)
                                              .movetoarchive(
                                            table1: 'employer',
                                            table2: 'archive',
                                            basicsal: model.basicsal!,
                                            companyname: model.companyname!,
                                            foodsal: model.foodsal!,
                                            file: model.url!,
                                            fullnum: model.fullnum!,
                                            jobtitle: model.jobtitle,
                                            metrosal: model.metrosal!,
                                            name: model.username!,
                                            passnum: model.passnum!,
                                            passtime: model.passtime!,
                                            sknsal: model.sknsal!,
                                            starttime: model.starttime,
                                            totalsal: model.totalsal!,
                                            uid: model.uid!,
                                            visanum: model.visanum!,
                                            visatime: model.visatime,
                                            workcardtime: model.workcardtime,
                                          ).then((value)  {

                                          }).catchError((error){
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
                                              desc: "حدث خطأ ما",
                                              btnOkOnPress: (){},
                                              btnOkColor: Colors.red,
                                              width: MediaQuery.of(context).size.width*0.25,

                                            ).show();
                                          });


                                        },
                                      ),
                                    ],
                                  ),
                                );

                              },
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "حذف",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              )),
                          SizedBox(width:MediaQuery.of(context).size.shortestSide*0.05,),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(scaleanimation(
                                    page: update(model: model, section: 'employer',)
                                ));
                              },
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "تعديل",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              )),
                          SizedBox(width:MediaQuery.of(context).size.shortestSide*0.05,),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context , WaveTransition(
                                    child: viewprofile( model: model,),

                                    center: FractionalOffset(0.90, 0.90),

                                    duration: Duration(milliseconds: 3000),
                                    settings: RouteSettings(arguments: "yeah! it works!")),
                                );
                              },
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "عرض",
                                  style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    ),
  );

  Widget builditems(BuildContext context,state) => Column(
    children: [
      Container(
        // color: Colors.red,
        child: GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1 / 1,
          children: List.generate(
              employ.length, (index) => buildgrid(employ[index], context,state)),
        ),
      ),
    ],
  );
  Widget none(context)=>Container(
    //width: double.infinity,
    height:MediaQuery.of(context).size.height*0.9,

    child:
    Center(
      child: AnimatedTextKit(animatedTexts: [
        ColorizeAnimatedText("لا يوجد موظفين"
            ,  textStyle: TextStyle(fontSize: 50,),
            colors: [
              Color(0xFFff9671),
              Color(0xFFffc75f),
              Color(0xFFf9f871),
            ])
      ]),
    ),



  );
}
