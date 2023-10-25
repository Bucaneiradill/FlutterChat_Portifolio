import 'package:flutter/material.dart';
import 'package:flutter_chat_portifolio/components/dark_theme_provider.dart';
import 'package:flutter_chat_portifolio/view/home_page.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
            routes: <String, WidgetBuilder>{
              // '/': (BuildContext context) => const Login(),
              '/conversas': (BuildContext context) => const HomePage(),
            },
          );
        },
      ),
    );
  }
}
