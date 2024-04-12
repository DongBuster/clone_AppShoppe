import 'dart:async';

import 'package:clone_shoppe/firebase/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/bought_product.dart';
import 'provider/checkboxCartScreen.dart';
import 'provider/create_accout.dart';
import 'provider/detailProductModel.dart';
import 'provider/headerDetailProduct.dart';
import 'provider/listProductCart.dart';
import 'provider/list_purchase_order.dart';
import 'provider/selectedProductCart.dart';
import 'provider/stateActiveColorIconHeader.dart';
import 'provider/stateActiveIconHome.dart';
import 'route/route_config.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://jmyuwdevbxyhdroplwek.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpteXV3ZGV2Ynh5aGRyb3Bsd2VrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTExNzMwMzgsImV4cCI6MjAyNjc0OTAzOH0.xBGddifueY9CoYAV8sKba2bDLvGle_KXXxRqsRfXNlg',
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CreateAccout(),
        ),
        ChangeNotifierProvider(
          create: (_) => StateActiveIconHome(),
        ),
        ChangeNotifierProvider(
          create: (_) => StateActiveColorIconHeader(),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailProductModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => SateHeaderDetailProduct(),
        ),
        ChangeNotifierProvider(
          create: (_) => ListProductCart(),
        ),
        ChangeNotifierProvider(
          create: (_) => BoughtProduct(),
        ),
        ChangeNotifierProvider(
          create: (_) => ListProductPurchureOder(),
        ),
        ChangeNotifierProvider(
          create: (_) => CheckBoxCartScreen(),
        ),
        ChangeNotifierProvider(
          create: (_) => SelectedProductCart(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
