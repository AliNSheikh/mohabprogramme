
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohab/Home.dart';
import 'package:mohab/splash.dart';
import 'package:mohab/statemange/appstates.dart';
import 'package:mohab/statemange/cubit.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Parse().initialize(
    'U8rcFinDY10JM7orIPJndK5kJVcU3T3haohLEU5a',
    'https://parseapi.back4app.com/',
    clientKey: '0ECw2nJSVcYsCQh0WYlm531V9IVkzgMR2QJe4iak',
    autoSendSessionId: true,
    debug: true,
  );

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => appcubit(),

      child: BlocConsumer<appcubit,appstates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },


      ),
    );
  }
}


