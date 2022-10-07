import 'package:family_garden/routes/app_pages.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Family Garden",
      initialRoute: AppPages.INITIAL,
      // initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      theme: ThemeData(
          //   primarySwatch: AppColors.colorPrimarySwatch,
          //   visualDensity: VisualDensity.adaptivePlatformDensity,
          //   brightness: Brightness.light,
          //   primaryColor: AppColors.colorPrimary,
          //   textTheme: const TextTheme(
          //     button: TextStyle(
          //       color: AppColors.white,
          //       fontSize: 20.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          textTheme: GoogleFonts.workSansTextTheme()),
      debugShowCheckedModeBanner: false,
    );
  }
}
