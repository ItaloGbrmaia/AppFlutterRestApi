import 'package:flutter_application_api/features/auth/views/auth_page.dart';
import 'package:flutter_application_api/features/details/view/details_page.dart';
import 'package:flutter_application_api/features/home/views/home_page.dart';
import 'package:flutter_application_api/features/register/view/register_page.dart';
import 'package:flutter_application_api/features/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ChildRoute('/home', child: (context, args) => const HomePage()),
        ChildRoute('/auth', child: (context, args) => const authPage()),
        ChildRoute('/register', child: (context, args) => const registerPage()),
        ChildRoute('/details', child: (context, args) => const Details_Page()),
      ];
}
