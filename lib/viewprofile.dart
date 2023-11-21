import 'package:flutter/material.dart';
import 'package:mohab/model/empmod.dart';
import 'package:wave_transition/wave_transition.dart';

import 'animation/animation.dart';

class viewprofile extends StatelessWidget {
  employmodel model;
  viewprofile({required this.model});

  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * 100;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () async {
              Navigator.of(context).pop(

                      );
              //navandfin(context, seller());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.tealAccent,
            ),
          ),
          title: Text('${model.username}'),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.red,
            fontSize: 22.0,
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
          child: Column(
            children: <Widget>[
              //==========================================================================================
              // build Top Section of Profile (include : Profile Image)
              //==========================================================================================
              _buildHeader(),

              //==========================================================================================
              // build middle Section of Profile (include : main info  )
              //==========================================================================================
              _buildMainInfo(context, widthC),

              SizedBox(height: 10.0),

              _buildInfoCard(context),

              //==========================================================================================
              //  build Bottom Section of Profile (include : email - phone number - about - location )
              //==========================================================================================
              _buildInfo(context, widthC),
            ],
          ),
        ));
  }

  Widget _buildHeader() {
    return Stack(
      children: <Widget>[
        Ink(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
            gradient: LinearGradient(colors: [
              Colors.blue,
              Colors.blueAccent,
              Colors.lightBlue,
              Colors.lightBlueAccent,
              Colors.blueGrey,
            ]),
          ),
        ),
        Ink(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 140),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                color: Colors.white,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(colors: [
                      Colors.white,
                      Colors.blueGrey,
                      Colors.lightBlueAccent,
                      Colors.lightBlue,
                      Colors.blueAccent,
                    ]),
                  ),
                  child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(85),
                        child: Image.network(
                            model.url!.url!,
                            width: 185,
                            height: 185,
                            fit: BoxFit.fill)),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMainInfo(BuildContext context, double width) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(10),
      alignment: AlignmentDirectional.center,
      child: Column(
        children: <Widget>[
          Text('${model.username}',
          textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,

                  fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          Text('الشركة : ${model.companyname} ', style: TextStyle(color: Colors.green,fontSize: 18),textDirection: TextDirection.rtl,),
          SizedBox(height: 15),
          Text('المسمى الوظيفي : ${model.jobtitle} ', style: TextStyle(color: Colors.cyan,fontSize: 15),textDirection: TextDirection.rtl,),
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context, double width) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        trailing:  Icon(
                          Icons.monetization_on_outlined,
                          color: Colors.cyanAccent,
                        ),
                        title: Text("الراتب الاجمالي",textDirection: TextDirection.rtl,textAlign:TextAlign.center,),
                        subtitle: Text("${model.totalsal}",textAlign:TextAlign.center,textDirection: TextDirection.rtl),
                      ),
                      Divider(),
                      ListTile(
                        trailing: Icon(
                        Icons.attach_money,
                        color: Colors.cyanAccent,
                      ),
                        title: Text("الراتب الاساسي",textDirection: TextDirection.rtl,textAlign:TextAlign.center,),
                        subtitle: Text("${model.basicsal}",textAlign:TextAlign.center,textDirection: TextDirection.rtl),
                      ),
                      Divider(),
                      ListTile(
                        trailing:Icon(
                          Icons.home_work_outlined,
                          color: Colors.cyanAccent,
                        ),
                        title: Text("بدل السكن ",textDirection: TextDirection.rtl,textAlign:TextAlign.center,),
                        subtitle: Text("${model.sknsal}",textAlign:TextAlign.center,textDirection: TextDirection.rtl),
                      ),
                      Divider(),
                      ListTile(
                        trailing: Icon(
                          Icons.directions_bus,
                          color: Colors.cyanAccent,
                        ),
                        title: Text("بدل مواصلات ",textDirection: TextDirection.rtl,textAlign:TextAlign.center,),
                        subtitle: Text("${model.metrosal}",textAlign:TextAlign.center,textDirection: TextDirection.rtl),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.lightGreenAccent,
                          Colors.lightGreenAccent,
                          Colors.greenAccent,
                          Colors.greenAccent,
                        ]),
                  ),
                  width: 5.0,
                  height: 340,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        trailing: Icon(
                          Icons.fastfood_outlined,
                          color: Colors.cyanAccent,
                        ),
                        title: Text("بدل غلاء معيشة ",textDirection: TextDirection.rtl,textAlign:TextAlign.center,),
                        subtitle: Text("${model.foodsal}",textAlign:TextAlign.center,textDirection: TextDirection.rtl),
                      ),
                      Divider(),
                      ListTile(
                        trailing:  Icon(
                          Icons.menu_book,
                          color: Colors.cyanAccent,
                        ),
                        title: Text("رقم جواز السفر ",textDirection: TextDirection.rtl,textAlign:TextAlign.center,),
                        subtitle: Text("${model.passnum}",textAlign:TextAlign.center,textDirection: TextDirection.rtl),
                      ),
                      Divider(),
                      ListTile(
                        trailing:Icon(
                          Icons.home_work_outlined,
                          color: Colors.cyanAccent,
                        ),
                        title: Text("رقم ملف الاقامة  ",textDirection: TextDirection.rtl,textAlign:TextAlign.center,),
                        subtitle: Text("${model.visanum}",textAlign:TextAlign.center,textDirection: TextDirection.rtl),
                      ),
                      Divider(),
                      ListTile(
                        trailing:Icon(
                          Icons.numbers_rounded,
                          color: Colors.cyanAccent,
                        ),
                        title: Text("الرقم الموحد  ",textDirection: TextDirection.rtl,textAlign:TextAlign.center,),
                        subtitle: Text("${model.fullnum}",textAlign:TextAlign.center,textDirection: TextDirection.rtl),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
  Widget _buildInfoCard(context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Card(
            elevation: 5.0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 16.0, right: 10.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        'تاريخ التعيين',
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: new Text(
                          '${model.starttime}',
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: Color(0Xffde6262),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new Text(
                        'تاريخ انتهاء الجواز',
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: new Text(
                          '${model.passtime}',
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: Color(0Xffde6262),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new Text(
                        'تاريخ انتهاء بطاقة العمل',
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: new Text(
                          '${model.workcardtime}',
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: Color(0Xffde6262),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new Text(
                        'تاريخ انتهاء الاقامة ',
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: new Text(
                          '${model.visatime}',
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: Color(0Xffde6262),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}