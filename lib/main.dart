import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trampoapp/routes/RoutesName.dart';
import 'package:trampoapp/screens/events_list_screen.dart';
import 'package:trampoapp/screens/home_screen.dart';
import 'package:trampoapp/screens/login_screen.dart';
import 'package:trampoapp/screens/sign_up_screen.dart';
import 'package:trampoapp/screens/splash_screen.dart';
import 'package:trampoapp/screens/venue_list_screen.dart';
import 'package:trampoapp/view_model/events_view_model.dart';
import 'package:trampoapp/view_model/venue_view_model.dart';

void main() {
  runApp(const MyApp());
}

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      debugShowCheckedModeBanner: false,

      home: LoginScreen(),
    );
  }

}
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventsViewModel()),
        ChangeNotifierProvider(create: (_) => VenueViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trampo',
        initialRoute: RoutesName.splashRoute,
        routes: {
          RoutesName.splashRoute: (context) => SplashScreen(),
          RoutesName.venuesListRoute: (context) => VenueListScreen(),
          RoutesName.eventsListRoute: (context) => EventsListScreen(),
          RoutesName.loginScreenRoute: (context) => LoginScreen(),
          RoutesName.signupScreenRoute: (context) => SignupScreen(),
          RoutesName.homeScreenRoute: (context) => HomeScreen(),
        },
        onGenerateRoute: (settings) {
         /* if (settings.name == RoutesName.eventsListRoute) {
            final args = settings.arguments as Map<String, dynamic>;
            *//*
            final catId = int.parse(args["catId"]);
*//*
            return MaterialPageRoute(builder: (context) => EventsListScreen());
          }*/
          // Return null if the route is not found
          return null;
        },
      ),
    );
  }
}
