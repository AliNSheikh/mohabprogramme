import 'package:flutter/material.dart';
import 'package:mohab/sortemp.dart';

import 'Home.dart';
import 'animation/animation.dart';

class allcom extends StatelessWidget {
  const allcom({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () async {

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
        title: Text('ALL Companies'),
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [

                Colors.black26,

                Colors.black38,

                Colors.black
               // Color(0xff00c2a8),
              //  Color(0xff008b74),


              ]),
        ),
        height: double.infinity,
        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(AnimationsRouteltr(
                            page: sortemp(type: 'المركز الهندسي الدولي',),
                          ));
                          // nav(context, addbook());
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),


                            // color: Colors.tealAccent,
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                                color: Color(0xff009efa),
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(
                              color:Color(0xff009efa),
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: 125.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              'المركز الهندسي الدولي',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18, color:Color(0xff009efa),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.15,
                      ),
                      InkWell(
                        onTap: () {
                          //selcubit.get(context).resetsearch();
                          Navigator.of(context).push(AnimationsRouteltr(
                            page: sortemp(type: 'المركز الهندسي الدولي فرع دبا',),),

                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                                color: Color(0xff00d2fc),
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(
                              color:Color(0xff00d2fc),
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: 125.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              'المركز الهندسي الدولي فرع دبا',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,  color: Color(0xff00d2fc),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.15,
                      ),
                      InkWell(
                        onTap: () {
                          //selcubit.get(context).resetsearch();
                          Navigator.of(context).push(AnimationsRouteltr(
                            page: sortemp(type: 'التضامن للتجارة العامة',),),

                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                                color: Color(0xff4ffbdf),
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(
                              color:  Color(0xff4ffbdf),
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: 125.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              'التضامن للتجارة العامة',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,   color: Color(0xff4ffbdf),),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(AnimationsRouteltr(
                            page: sortemp(type: 'التضامن لمواد البناء',),
                          ));
                          // nav(context, addbook());
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),


                            // color: Colors.tealAccent,
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                                color: Color(0xffA10725),
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(
                              color: Color(0xffA10725),
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: 125.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              'التضامن لمواد البناء',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Color(0xffA10725),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.15,
                      ),
                      InkWell(
                        onTap: () {
                          //selcubit.get(context).resetsearch();
                          Navigator.of(context).push(AnimationsRouteltr(
                            page: sortemp(type: 'مركز الجزيرة الطبي',),),

                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                                color: Color(0xffFF0939),
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(
                              color:Color(0xffFF0939),
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: 125.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              'مركز الجزيرة الطبي',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18, color: Color(0xffFF0939),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.15,
                      ),
                      InkWell(
                        onTap: () {
                          //selcubit.get(context).resetsearch();
                          Navigator.of(context).push(AnimationsRouteltr(
                            page: sortemp(type: 'صيدلية الجزيرة',),),

                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                                color: Color(0xffF66783),
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(
                              color: Color(0xffF66783),
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: 125.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              'صيدلية الجزيرة',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Color(0xffF66783),),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(AnimationsRouteltr(
                            page: sortemp(type: 'المركز الطبي التخصصي',),
                          ));
                          // nav(context, addbook());
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),


                            // color: Colors.tealAccent,
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                                color: Color(0xffE8FF00),
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(
                              color: Color(0xffE8FF00),
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: 125.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              'المركز الطبي التخصصي',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Color(0xffE8FF00),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.15,
                      ),
                      InkWell(
                        onTap: () {
                          //selcubit.get(context).resetsearch();
                          Navigator.of(context).push(AnimationsRouteltr(
                            page: sortemp(type: 'صيدلية المركز الطبي',),),

                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                                color: Color(0xffDEF02A),
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(
                              color: Color(0xffDEF02A),
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: 125.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              'صيدلية المركز الطبي',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Color(0xffDEF02A),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.15,
                      ),
                      InkWell(
                        onTap: () {
                          //selcubit.get(context).resetsearch();
                          Navigator.of(context).push(AnimationsRouteltr(
                            page: sortemp(type: 'العبدولي للاستشارات الهندسية',),),

                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                              color: Color(0xffEFF988),
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(
                              color: Color(0xffEFF988),
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: 125.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              'العبدولي للاستشارات الهندسية',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,  color: Color(0xffEFF988),),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(AnimationsRouteltr(
                            page: sortemp(type: 'راشد العبدولي للتجارة العامة',),
                          ));
                          // nav(context, addbook());
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),


                            // color: Colors.tealAccent,
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                                color: Color(0xff1EA824),
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(
                              color: Color(0xff1EA824),
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: 125.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              'راشد العبدولي للتجارة العامة',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18, color: Color(0xff1EA824),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.15,
                      ),
                      InkWell(
                        onTap: () {
                          //selcubit.get(context).resetsearch();
                          Navigator.of(context).push(AnimationsRouteltr(
                            page: sortemp(type: 'التضامن تيم لاعمال النجارة والاصباغ',),),

                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                                color: Color(0xff07ED11),
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(
                              color: Color(0xff07ED11),
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: 125.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              'التضامن تيم لاعمال النجارة والاصباغ',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Color(0xff07ED11),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.15,
                      ),
                      InkWell(
                        onTap: () {
                          //selcubit.get(context).resetsearch();
                          Navigator.of(context).push(AnimationsRouteltr(
                            page: sortemp(type: 'التضامن لاعمال النجارة',),),

                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                                color: Color(0xff3FFF47),
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(
                              color: Color(0xff3FFF47),
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: 125.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              'التضامن لاعمال النجارة',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,      color: Color(0xff3FFF47),),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(AnimationsRouteltr(
                            page: sortemp(type: 'التضامن لاعمال تنفيذ التصميم الداخلي',),
                          ));
                          // nav(context, addbook());
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),


                            // color: Colors.tealAccent,
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                                color: Color(0xffFFC53F),
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(
                              color: Color(0xffFFC53F),
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: 125.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              'التضامن لاعمال تنفيذ التصميم الداخلي',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18, color: Color(0xffFFC53F),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.30,
                      ),
                      InkWell(
                        onTap: () {
                          //selcubit.get(context).resetsearch();
                          Navigator.of(context).push(AnimationsRouteltr(
                            page: sortemp(type: 'سرا لمقاولات البناء',),),

                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10.0,
                                color: Color(0xffAC7800),
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(
                              color: Color(0xffAC7800),
                              width: 5.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          height: 125.0,
                          width: 250.0,
                          child: Center(
                            child: Text(
                              'سرا لمقاولات البناء',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,  color: Color(0xffAC7800),),
                            ),
                          ),
                        ),
                      ),



                    ],
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
