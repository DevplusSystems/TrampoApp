import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trampoapp/models/login/LoginRequest.dart';
import 'package:trampoapp/repository/user_repository.dart';
import 'package:trampoapp/routes/RoutesName.dart';
import 'package:trampoapp/screens/events_list_screen.dart';
import 'package:trampoapp/screens/home_screen.dart';
import 'package:trampoapp/screens/login_screen.dart';
import 'package:trampoapp/screens/sign_up_screen.dart';
import 'package:trampoapp/screens/splash_screen.dart';
import 'package:trampoapp/screens/venue_list_screen.dart';
import 'package:trampoapp/services/api_service.dart';
import 'package:trampoapp/values/colors.dart';
import 'package:trampoapp/view_model/LoginViewModel.dart';
import 'package:trampoapp/view_model/events_view_model.dart';
import 'package:trampoapp/view_model/venue_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(
          create: (_) => ApiService(),
        ),
        ProxyProvider<ApiService, UserRepository>(
          update: (_, apiService, __) => UserRepository(apiService),
        ),
        ChangeNotifierProvider(create: (_) => EventsViewModel()),
        ChangeNotifierProvider(create: (_) => VenueViewModel()),
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(context.read<UserRepository>()),
        ),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Trampo',
            theme: ThemeData(
              useMaterial3: true,
            ),
            initialRoute: RoutesName.splashRoute,
            routes: {
              RoutesName.splashRoute: (context) => SplashScreen(),
              RoutesName.venuesListRoute: (context) => VenueListScreen(),
              RoutesName.eventsListRoute: (context) => EventsListScreen(),
              RoutesName.homeScreenRoute: (context) => HomeScreen(),
            },
            onGenerateRoute: (settings) {
              return null;
            },
          );
        },
      ),
    );
  }
}
