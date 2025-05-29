import 'package:liberty_app/constants/utils/exports.dart';
import 'package:responsive_builder/responsive_builder.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      breakpoints: const ScreenBreakpoints(
        tablet: 600,
        desktop: 950,
        watch: 300,
      ),
      builder: (context, sizeInfo) {
        return ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: sizeInfo.deviceScreenType == DeviceScreenType.mobile 
            ? const Size(430, 932) 
            : const Size(744, 1133),
          builder: (context, child) {
            return MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'DO-IT',
              theme: ThemeData.light(useMaterial3: true).copyWith(
                dividerTheme: const DividerThemeData(
                  color: Colors.transparent,
                ),
                datePickerTheme: DatePickerThemeData(
                  headerBackgroundColor: DoItColors.blue,
                  todayBackgroundColor: WidgetStateProperty.all(DoItColors.blue),
                  dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return DoItColors.blue;
                    }
                    return null;
                  }),
                ),
                scaffoldBackgroundColor: DoItColors.white,
                appBarTheme: AppBarTheme(
                  iconTheme: const IconThemeData(
                    color: DoItColors.grey,
                  ),
                  centerTitle: true,
                  titleTextStyle: TextStyle(
                    color: DoItColors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  elevation: 0.sp,
                ),
                iconTheme: const IconThemeData(
                  color: DoItColors.grey,
                ),
                cardColor: DoItColors.white,
                brightness: Brightness.light,
                colorScheme: ThemeData().colorScheme.copyWith(
                  secondary: DoItColors.thinGrey,
                  brightness: Brightness.light,
                ),
              ),
              home: OnboardingScreen(),
            );
          });
      }
    );
  }
}
