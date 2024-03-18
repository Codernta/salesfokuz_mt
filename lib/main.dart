import 'package:flutter/material.dart';
import 'package:salesfokuz_mt/Injections/dependency_injections.dart';
import 'package:salesfokuz_mt/Provider/user_detail_provider.dart';
import 'package:salesfokuz_mt/Provider/user_search_provider.dart';
import 'package:salesfokuz_mt/View/HomeScreen/home_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => GitHubProfileProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  HomeScreen(),
      ),
    );
  }
}

