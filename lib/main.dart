import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  runApp(const BooklyApp());

  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(KFeaturedBox);
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: KPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}
