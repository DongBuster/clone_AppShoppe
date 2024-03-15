import 'package:clone_shoppe/firebase/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/checkboxCartScreen.dart';
import 'provider/create_accout.dart';
import 'provider/detailProductModel.dart';
import 'provider/headerDetailProduct.dart';
import 'provider/listProductCart.dart';
import 'provider/selectedProductCart.dart';
import 'provider/stateActiveColorIconHeader.dart';
import 'provider/stateActiveIconHome.dart';
import 'route/route_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
