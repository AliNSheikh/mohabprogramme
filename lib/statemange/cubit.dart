import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'dart:io';

import '../model/empmod.dart';
import '../reusable.dart';
import 'appstates.dart';

class appcubit extends Cubit<appstates> {
  appcubit() : super(appinitstate());

  static appcubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool ispass = true;
  var type = '';
  File? profileimage;
  XFile? pickedFile;
  var picker = ImagePicker();
  ParseFileBase? parseFile;


  void changeicon() {
    ispass = !ispass;
    suffix = ispass ? Icons.visibility : Icons.visibility_off;
    emit(changeiconpasstate());
  }
  //login
  Future<void> login({
    required String pass,
  }) async {
     emit(loginloadstate())   ;
    await Future.delayed(Duration(seconds: 3) );
     if(pass=="mohab2007"){
       emit(loginsuccstate());
     }else{
       emit(loginerrorstate());

     }

  }
 //pickimage
  Future<void> getImage() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileimage=File(pickedFile.path);
      parseFile = ParseFile(File(pickedFile.path));
      await  parseFile?.save();
      emit(addimagesuccessstate());
    } else {
      emit(addimageerrorstate());
    }
  }

  Future<void> resetImage() async {
    profileimage = null;
    parseFile=null;
  }
  void setcomtype(String val) {
    type = val;
    emit(comtypestate());
  }

  Future<void>createemp({
    required String name,
    required String jobtitle,
    required String starttime,
    required String passtime,
    required String visatime,
    required String workcardtime,
    required String companyname,
    required String totalsal,
    required String basicsal,
    required String sknsal,
    required String metrosal,
    required String foodsal,
    required String fullnum,
    required String visanum,
    required String passnum,
})async {
    emit(addempload());
    var Employer = ParseObject('employer');
    Employer.set('name', name );
    Employer.set('jobtitle', jobtitle );
    Employer.set('starttime', starttime );
    Employer.set('visatime', visatime );
    Employer.set('passtime', passtime );
    Employer.set('workcardtime', workcardtime );
    Employer.set('companyname', companyname );
    Employer.set('totalsal', totalsal);
    Employer.set('basicsal', basicsal);
    Employer.set('sknsal', sknsal);
    Employer.set('metrosal', metrosal);
    Employer.set('foodsal', foodsal);
    Employer.set('fullnum', fullnum);
    Employer.set('visanum', visanum);
    Employer.set('passnum', passnum);
    if(parseFile!=null){
      Employer.set('file', parseFile);
    }
    await Employer.save().then((value) {
      emit(addempsucc());
    }).catchError((error){
      emit(addemperror());
    });

  }


  //sortemp
  Future<void> empbycom({required String type})async {
    employ=[];
    getter=[];
    emit(getempload());
    QueryBuilder<ParseObject> queryemp =
    QueryBuilder<ParseObject>(ParseObject('employer'))
    ..whereEqualTo('companyname', type);
    final response = await queryemp.query();
    if (response.success && response.results != null){
      getter=response.results as List<ParseObject>;
      getter.forEach((element) {
          employ.add(employmodel.fromJson(element));

            });

      emit(getempsuc());

    }else{
      emit(getemperr());
      print("fail");
    }


  }
  Future<void> archemp()async {
    employ=[];
    getter=[];
    emit(getempload());
    QueryBuilder<ParseObject> queryemp =
    QueryBuilder<ParseObject>(ParseObject('archive'));
    final response = await queryemp.query();
    if (response.success && response.results != null){
      getter=response.results as List<ParseObject>;
      getter.forEach((element) {
        employ.add(employmodel.fromJson(element));


      });
      if(employ.length==0){
        test=[];
      }
      emit(getempsuc());

    }else{
      emit(getemperr());
      print("fail");
    }


  }

  void showMaterialDialog<T>({required BuildContext context, required Widget child})
  {
    showDialog<T>(context: context,
      builder: (BuildContext context)=>child,);
  }
  Future<void>movetoarchive({
    required String table1,
    required String table2,
    required String name,
    required String jobtitle,
    required String starttime,
    required String passtime,
    required String visatime,
    required String workcardtime,
    required String companyname,
    required String totalsal,
    required String basicsal,
    required String sknsal,
    required String metrosal,
    required String foodsal,
    required String fullnum,
    required String visanum,
    required String passnum,
    required String uid,
    required ParseFileBase file,
})async {
    emit(arcempload());

  var  parseObject = ParseObject(table1)
      ..objectId = uid;

    var Archive = ParseObject(table2);
    //Archive.set('objectId', uid );
    Archive.set('name', name );
    Archive.set('jobtitle', jobtitle );
    Archive.set('starttime', starttime );
    Archive.set('visatime', visatime );
    Archive.set('passtime', passtime );
    Archive.set('workcardtime', workcardtime );
    Archive.set('companyname', companyname );
    Archive.set('totalsal', totalsal);
    Archive.set('basicsal', basicsal);
    Archive.set('sknsal', sknsal);
    Archive.set('metrosal', metrosal);
    Archive.set('foodsal', foodsal);
    Archive.set('fullnum', fullnum);
    Archive.set('visanum', visanum);
    Archive.set('passnum', passnum);
      Archive.set('file', file);

    await Archive.save().then((value) async {
      await parseObject.delete().
      then((value) {
        emit(arcempsucc());

      } ).catchError((error){  emit(arcemperror());});

    }).catchError((error){
      emit(arcemperror());
    });

  }

  Future<void>updateemp({
    required String section,
    required String name,
    required String jobtitle,
    required String starttime,
    required String passtime,
    required String visatime,
    required String workcardtime,
    required String companyname,
    required String totalsal,
    required String basicsal,
    required String sknsal,
    required String metrosal,
    required String foodsal,
    required String fullnum,
    required String visanum,
    required String passnum,
    required String uid,
  })async {
    emit(addempload());
    var Employer = ParseObject(section)..objectId=uid
    ..set('name', name )
    ..set('jobtitle', jobtitle )
    ..set('starttime', starttime )
    ..set('visatime', visatime )
    ..set('passtime', passtime )
    ..set('workcardtime', workcardtime )
    ..set('companyname', companyname )
    ..set('totalsal', totalsal)
    ..set('basicsal', basicsal)
    ..set('sknsal', sknsal)
    ..set('metrosal', metrosal)
    ..set('foodsal', foodsal)
    ..set('fullnum', fullnum)
    ..set('visanum', visanum)
    ..set('passnum', passnum);
    if(parseFile!=null){
      Employer.set('file', parseFile);
    }
    await Employer.save().then((value) {
      emit(addempsucc());
    }).catchError((error){
      emit(addemperror());
    });

  }
  Future<void> searchemp({required String name})async {
    employ=[];
    getter=[];
    emit(getempload());
    QueryBuilder<ParseObject> queryemp =
    QueryBuilder<ParseObject>(ParseObject('employer'))
      ..whereContains("name", name) ;
    final response = await queryemp.query();
    if (response.success && response.results != null){
      getter=response.results as List<ParseObject>;
      getter.forEach((element) {
        employ.add(employmodel.fromJson(element));

      });

      emit(getempsuc());

    }else{
      emit(getemperr());
      print("fail");
    }


  }
  Future<void>resetsearch()async {
    getter=[];
    employ=[];
  }
}