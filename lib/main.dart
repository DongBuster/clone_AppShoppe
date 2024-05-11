import 'dart:async';
import 'package:clone_shoppe/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/page/detailProductsPage/provider/detail_product_provider.dart';
import 'provider/bought_product.dart';
import 'provider/checkbox_cart_screen.dart';
import 'provider/create_accout.dart';
import 'provider/list_product_cart.dart';
import 'provider/list_purchase_order.dart';
import 'provider/selected_product_cart.dart';
import 'features/page/homePage/provider/home_page_state.dart';
import 'route/route_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://bckotsxlxlwgfovdxarv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJja290c3hseGx3Z2ZvdmR4YXJ2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ5ODYwMzAsImV4cCI6MjAzMDU2MjAzMH0.mQz8604uSy05Yu6pdJHsQ8ypP5znMOa99j9mW41kSrg',
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
          create: (_) => HomePageState(),
        ),
        ChangeNotifierProvider(
          create: (_) => StateDetailProduct(),
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
