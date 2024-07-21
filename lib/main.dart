import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoodie/common/themes.dart';
import 'package:smoodie/firebase_options.dart';
import 'package:smoodie/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: "Smoodie",
      routerConfig: ref.watch(routerProvider),
      theme: SmoodieTheme.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
