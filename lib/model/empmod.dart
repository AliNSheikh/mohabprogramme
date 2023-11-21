import 'package:parse_server_sdk/parse_server_sdk.dart';

class employmodel{
  late  String? uid;
  late  String? username;
  late String jobtitle;
  late String starttime;
  late String visatime;
  late  String workcardtime;
  late  String? companyname;
  late String? totalsal;
  late String? basicsal;
  late String? foodsal;
  late String? sknsal;
  late String? metrosal;
  late String? visanum;
  late String? passnum;
  late String? fullnum;
  late String? passtime;
  late ParseFileBase? url;


  employmodel({
    required this.uid,
    required this.username,
    required this.metrosal,
    required this.sknsal,
    required this.basicsal,
    required this.totalsal,
    required this.jobtitle,
    required this.companyname,
    required this.foodsal,
    required this.fullnum,
    required this.passnum,
    required this.passtime,
    required this.starttime,
    required this.visanum,
    required this.visatime,
    required this.workcardtime,
    required this.url,
});

  employmodel.fromJson(ParseObject obj){
    uid=obj.get<String>("objectId");
    username=obj.get<String>("name");
    metrosal=obj.get<String>("metrosal");
    sknsal=obj.get<String>("sknsal");
    basicsal=obj.get<String>("basicsal");
    totalsal=obj.get<String>("totalsal");
    jobtitle=obj.get<String>("jobtitle")! ?? "";
    companyname=obj.get<String>("companyname");
    foodsal=obj.get<String>("foodsal");
    fullnum=obj.get<String>("fullnum");
    passnum=obj.get<String>("passnum");
    passtime=obj.get<String>("passtime");
    starttime=obj.get<String>("starttime")! ?? "";
    visanum=obj.get<String>("visanum");
    visatime=obj.get<String>("visatime")! ?? "";
    workcardtime=obj.get<String>("workcardtime")!;
    url=obj.get<ParseFileBase>("file");
  }

}
late employmodel newemp;