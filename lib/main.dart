import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/ui/cubit/anasayfa_cubit.dart';
import 'package:foods_app/ui/cubit/detay_sayfa_cubit.dart';
import 'package:foods_app/ui/cubit/sepet_sayfa_cubit.dart';
import 'package:foods_app/ui/views/anasayfa.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AnasayfaCubit()),
          BlocProvider(create: (context) => DetaySayfaCubit()),
          BlocProvider(create: (context) => SepetSayfaCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Anasayfa(),
        )
    );
  }
}

