import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mohab/allcom.dart';
import 'package:mohab/archive.dart';
import 'package:mohab/reusable.dart';
import 'package:mohab/search.dart';
import 'package:mohab/statemange/cubit.dart';

import 'addemp.dart';
import 'animation/animation.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 8.0,
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
        title: Text(
          'MOHAB',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.tealAccent,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            letterSpacing: 4.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF218c74),
              Color(0xFF34ace0),
                Color(0xFF33d9b2),
                Color(0xFF227093),
              ]),
        ),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider(

                  items: [
                    Image(
                      image: AssetImage('images/1.png'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage('images/2.png'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage('images/3.png'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage('images/4.png'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage('images/5.png'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    
                  ],
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height*0.50,

                    reverse: false,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1.0,
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: 4.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Colors.lightGreenAccent,
                          Colors.lightGreenAccent,
                          Colors.greenAccent,
                          Colors.greenAccent,
                        ]),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100.0,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(AnimationsRouteltr(
                              page:addemp(),
                            ));

                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(25)),
                              // color: Colors.tealAccent,
                              boxShadow: [
                                BoxShadow(
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 10.0,
                                  color: Colors.white,
                                  offset: Offset(0, 0),
                                )
                              ],
                              border: Border.all(
                                color: Colors.white,
                                width: 5.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            height: 100.0,
                            width: 100.0,
                            child: Center(
                              child: Text(
                                'إضافة موظف',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.3,
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.of(context).push(AnimationsRouteltr(
                              page: allcom(),),

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
                                  color: Colors.red,
                                  offset: Offset(0, 0),
                                )
                              ],
                              border: Border.all(
                                color: Colors.redAccent,
                                width: 5.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            height: 100.0,
                            width: 100.0,
                            child: Center(
                              child: Text(
                                'جميع الشركات',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.3,
                        ),
                        InkWell(
                          onTap: () async {
                            await appcubit.get(context).resetsearch();
                            test=['1'];
                            Navigator.of(context).push(AnimationsRoutertl(
                              page: search(),),

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
                                  color: Colors.amber,
                                  offset: Offset(0, 0),
                                )
                              ],
                              border: Border.all(
                                color: Colors.amberAccent,
                                width: 5.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            height: 100.0,
                            width: 100.0,
                            child: Center(
                              child: Text(
                                ' بحث عن موظف',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.amber),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(AnimationsRouteltr(
                          page:archive(),
                        ));

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(25)),
                          // color: Colors.tealAccent,
                          boxShadow: [
                            BoxShadow(
                              blurStyle: BlurStyle.outer,
                              blurRadius: 10.0,
                              color: Colors.black87,
                              offset: Offset(0, 0),
                            )
                          ],
                          border: Border.all(
                            color: Colors.black87,
                            width: 5.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        height: 100.0,
                        width: 100.0,
                        child: Center(
                          child: Text(
                            ' الارشيف',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87),
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
    );
  }
}
