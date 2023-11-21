import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mohab/statemange/appstates.dart';
import 'package:mohab/statemange/cubit.dart';

import 'Home.dart';
import 'animation/animation.dart';

class addemp extends StatelessWidget {
  var username = TextEditingController();
  var jobtitle = TextEditingController();
  var totalsal = TextEditingController();
  var basicsal = TextEditingController();
  var sknsal = TextEditingController();
  var metrosal = TextEditingController();
  var foodsal = TextEditingController();
  var passnum = TextEditingController();
  var visanum = TextEditingController();
  var fullnum = TextEditingController();
  var startdate=TextEditingController();
  var passdate = TextEditingController();
  var workcarddate = TextEditingController();
  var visadate =TextEditingController();
  var companyname = 'المركز الهندسي الدولي';

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    return  BlocConsumer<appcubit, appstates>(

      listener: (context, state) async {
        if (state is addempsucc) {
          AwesomeDialog(
            context: context,
            //dialogType: DialogType.error,
            customHeader: Icon(
              Icons.add_alert,
              size: 50.0,
              color: Colors.green,
            ),
            animType: AnimType.scale,
            headerAnimationLoop: false,
            title: "نجاح",
            desc: "تم اضافة الموظف بنجاح",
            btnOkOnPress: () async {
              Navigator.of(context).pushAndRemoveUntil(AnimationsRoutertl(
                page: home(),
              ), (route) => false);

              await appcubit.get(context).resetImage();
            },
            btnOkColor: Colors.green,
            width: MediaQuery.of(context).size.width*0.25,

          ).show();

        }
      },
      builder: (context, state) {
        File? profcov = appcubit.get(context).profileimage;

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
            title: Text('ADD New Employee'),
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
          body: Container(
            width: double.infinity,
            height:double.infinity ,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFfefedf),
                    Color(0xFFd5cabd),
                    Colors.black12,

                  ]),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                key: formkey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: username,

                                   // textDirection:TextDirection.rtl,
                                    textAlign: TextAlign.right,

                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'لا ينبغي ان يكون الاسم فارغ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.cyanAccent,
                                      ),
                                      //hintText: "أسم الموظف",
                                    //  hintTextDirection: TextDirection.rtl,
                                      labelText: "أسم الموظف",
                                      alignLabelWithHint: true,
                                      //Text('',textDirection: TextDirection.rtl,textAlign: TextAlign.start,),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  TextFormField(
                                    controller: jobtitle,

                                   // textDirection:TextDirection.rtl,
                                    textAlign: TextAlign.right,

                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'لا ينبغي ان يكون المسمى الوظيفي فارغ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.type_specimen_outlined,
                                        color: Colors.cyanAccent,
                                      ),
                                      //hintText: "أسم الموظف",
                                     // hintTextDirection: TextDirection.rtl,
                                      labelText: "المسمى الوظيفي ",
                                      alignLabelWithHint: true,
                                      //Text('',textDirection: TextDirection.rtl,textAlign: TextAlign.start,),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  TextFormField(
                                    controller: totalsal,

                                   // textDirection:TextDirection.rtl,
                                    textAlign: TextAlign.right,

                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'لا ينبغي ان يكون الراتب الاجمالي فارغ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.monetization_on_outlined,
                                        color: Colors.cyanAccent,
                                      ),

                                     // hintTextDirection: TextDirection.rtl,
                                      labelText: " الراتب الاجمالي",
                                      alignLabelWithHint: true,

                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  TextFormField(
                                    controller: basicsal,

                                  //  textDirection:TextDirection.rtl,
                                    textAlign: TextAlign.right,

                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'لا ينبغي ان يكون الراتب الاساسي فارغ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.attach_money,
                                        color: Colors.cyanAccent,
                                      ),

                                   //   hintTextDirection: TextDirection.rtl,
                                      labelText: " الراتب الاساسي",
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  TextFormField(
                                    controller: sknsal,

                                    //textDirection:TextDirection.rtl,
                                    textAlign: TextAlign.right,

                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'لا ينبغي ان يكون بدل السكن فارغ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.home_work_outlined,
                                        color: Colors.cyanAccent,
                                      ),
                                      //hintText: "أسم الموظف",
                                      //hintTextDirection: TextDirection.rtl,
                                      labelText: "بدل السكن",
                                      alignLabelWithHint: true,
                                      //Text('',textDirection: TextDirection.rtl,textAlign: TextAlign.start,),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  TextFormField(
                                    controller: metrosal,
                                    textAlign: TextAlign.right,

                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'لا ينبغي ان يكون بدل المواصلات فارغ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.directions_bus,
                                        color: Colors.cyanAccent,
                                      ),
                                      //hintText: "أسم الموظف",
                                      //hintTextDirection: TextDirection.rtl,
                                      labelText: " بدل المواصلات",
                                      alignLabelWithHint: true,
                                      //Text('',textDirection: TextDirection.rtl,textAlign: TextAlign.start,),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  TextFormField(
                                    controller: foodsal,
                                    textAlign: TextAlign.right,

                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'لا ينبغي ان يكون بدل غلاء المعيشة فارغ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.fastfood_outlined,
                                        color: Colors.cyanAccent,
                                      ),

                                      labelText: "بدل غلاء المعيشة",
                                      alignLabelWithHint: true,
                                      //Text('',textDirection: TextDirection.rtl,textAlign: TextAlign.start,),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 20.0,),


                                ],
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 300,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    image: profcov == null
                                        ? DecorationImage(
                                      image: AssetImage('images/profile.png'),
                                      fit: BoxFit.cover,
                                    )
                                        : DecorationImage(
                                      image: FileImage(profcov),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 3.0,
                                      style: BorderStyle.solid,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurStyle: BlurStyle.outer,
                                        blurRadius: 10.0,
                                        color: Colors.blueGrey,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),

                                ),
                                SizedBox(height: 10.0,),
                                Center(
                                  child: Container(
                                    width: 200.0,
                                    child: InkWell(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          profcov == null
                                              ? Icon(
                                            Icons.image,
                                            color: Colors.blueAccent,
                                            size: 35.0,
                                          ):Center(
                                            child: CircleAvatar(
                                              child: Image(
                                                image:AssetImage('images/correctsign.jpg') ,
                                              ),

                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          profcov == null
                                              ? Text(
                                            'Add Employ photo',
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold),
                                          )
                                              :Text(
                                            'Chang Employ photo',
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      onTap: () async {
                                        await appcubit.get(context).getImage();
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0,),
                                Row(

                                  children: [
                                    SizedBox(width: 30.0,),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.blueAccent,
                                          width: 1.0,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      child: DropdownButton(
                                        padding: EdgeInsets.only(
                                          left: 10.0,
                                        ),
                                        value: companyname,
                                        items: [
                                          'المركز الهندسي الدولي',
                                          'المركز الهندسي الدولي فرع دبا',
                                          'التضامن للتجارة العامة',
                                          'التضامن لمواد البناء',
                                          'مركز الجزيرة الطبي',
                                          'صيدلية الجزيرة',
                                          'المركز الطبي التخصصي',
                                          'صيدلية المركز الطبي',
                                          'العبدولي للاستشارات الهندسية',
                                          'راشد العبدولي للتجارة العامة',
                                          'التضامن تيم لاعمال النجارة والاصباغ',
                                          'التضامن لاعمال النجارة',
                                          'التضامن لاعمال تنفيذ التصميم الداخلي',
                                          'سرا لمقاولات البناء',
                                        ]
                                            .map((e) => DropdownMenuItem(
                                          child: Text('$e'),
                                          value: e,
                                        ))
                                            .toList(),
                                        onChanged: (value) {
                                          companyname = value!;
                                          appcubit.get(context).setcomtype(value);
                                        },
                                      ),
                                    ),
                                  SizedBox(width: 30.0,),

                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        'اسم الشركة:',
                                        //textDirection: TextDirection.RTL,
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: passnum,

                                   // textDirection:TextDirection.rtl,
                                    textAlign: TextAlign.right,

                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'لا ينبغي ان يكون رقم الجواز فارغ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.menu_book,
                                        color: Colors.cyanAccent,
                                      ),
                                      //hintText: "أسم الموظف",
                                    //  hintTextDirection: TextDirection.rtl,
                                      labelText: " رقم الجواز",
                                      alignLabelWithHint: true,
                                      //Text('',textDirection: TextDirection.rtl,textAlign: TextAlign.start,),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  TextFormField(
                                    controller: visanum,

                                    //textDirection:TextDirection.rtl,
                                    textAlign: TextAlign.right,

                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'لا ينبغي ان يكون  رقم ملف الاقامة فارغ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.library_books_outlined,
                                        color: Colors.cyanAccent,
                                      ),
                                      //hintText: "أسم الموظف",
                                      //hintTextDirection: TextDirection.rtl,
                                      labelText: "رقم ملف الاقامة ",
                                      alignLabelWithHint: true,
                                      //Text('',textDirection: TextDirection.rtl,textAlign: TextAlign.start,),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  TextFormField(
                                    controller: fullnum,

                                   // textDirection:TextDirection.rtl,
                                    textAlign: TextAlign.right,

                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'لا ينبغي ان يكون الرقم الموحد  فارغ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.numbers_rounded,
                                        color: Colors.cyanAccent,
                                      ),

                                      //hintTextDirection: TextDirection.rtl,
                                      labelText: " الرقم  الموحد",
                                      alignLabelWithHint: true,

                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  TextFormField(
                                    controller: startdate,
                                    onTap: (){
                                      showDatePicker(context: context, initialDate: DateTime.now(), firstDate:  DateTime(1900), lastDate: DateTime.parse('3000-01-01'),)
                                          .then((value) {
                                        startdate.text=DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                  //  textDirection:TextDirection.rtl,
                                    textAlign: TextAlign.right,

                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'لا ينبغي ان يكون تاريخ التعيين  فارغ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.calendar_month_rounded,
                                        color: Colors.cyanAccent,
                                      ),

                                     // hintTextDirection: TextDirection.rtl,
                                      labelText: "تاريخ التعيين",
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  TextFormField(
                                    controller: passdate,
                                    onTap: (){
                                      showDatePicker(context: context, initialDate: DateTime.now(), firstDate:  DateTime(1900), lastDate: DateTime.parse('3000-01-01'),)
                                          .then((value) {
                                        passdate.text=DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                  //  textDirection:TextDirection.rtl,
                                    textAlign: TextAlign.right,

                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'لا ينبغي ان يكون تاريخ انتهاء الجواز  فارغ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.calendar_month_rounded,
                                        color: Colors.cyanAccent,
                                      ),

                                     // hintTextDirection: TextDirection.rtl,
                                      labelText: "تاريخ انتهاء الجواز",
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  TextFormField(
                                    controller: workcarddate,
                                    onTap: (){
                                      showDatePicker(context: context, initialDate: DateTime.now(), firstDate:  DateTime(1900), lastDate: DateTime.parse('3000-01-01'),)
                                          .then((value) {
                                        workcarddate.text=DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                  //  textDirection:TextDirection.rtl,
                                    textAlign: TextAlign.right,

                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'لا ينبغي ان يكون تاريخ انتهاء بطاقة العمل  فارغ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.calendar_month_rounded,
                                        color: Colors.cyanAccent,
                                      ),

                                      //hintTextDirection: TextDirection.rtl,
                                      labelText: "تاريخ انتهاء بطاقة العمل",
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  TextFormField(
                                    controller: visadate,
                                    onTap: (){
                                      showDatePicker(context: context, initialDate: DateTime.now(), firstDate:  DateTime(1900), lastDate: DateTime.parse('3000-01-01'),)
                                          .then((value) {
                                         visadate.text=DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                  //  textDirection:TextDirection.rtl,
                                    textAlign: TextAlign.right,

                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'لا ينبغي ان يكون تاريخ انتهاء الاقامة  فارغ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.calendar_month_rounded,
                                        color: Colors.cyanAccent,
                                      ),

                                      //hintTextDirection: TextDirection.rtl,
                                      labelText: "تاريخ انتهاء الاقامة",
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 20.0,),


                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      ConditionalBuilder(
                        condition:state is! addempload,
                        builder: (context) => Center(
                          child: Container(
                            width: 200.0,
                            height: 35.0,
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 30,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: MaterialButton(
                              onPressed: () async {
                                if(formkey.currentState!.validate()){
                                  await  appcubit.get(context).createemp(
                                      name: username.text,
                                      jobtitle: jobtitle.text,
                                      starttime: startdate.text,
                                      passtime: passdate.text,
                                      visatime: visadate.text,
                                      workcardtime: workcarddate.text,
                                      companyname: companyname,
                                      totalsal: totalsal.text,
                                      basicsal: basicsal.text,
                                      sknsal: sknsal.text,
                                      metrosal: metrosal.text,
                                      foodsal: foodsal.text,
                                      fullnum: fullnum.text,
                                      visanum: visanum.text,
                                      passnum: passnum.text);
                                }


                              },
                              child: Text(
                                "حفظ",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,

                                ),
                              ),
                            ),
                          ),
                        ),
                        fallback: (BuildContext context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
