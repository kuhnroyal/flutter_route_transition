import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  timeDilation = 3.0;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        platform: TargetPlatform.iOS,
        useMaterial3: true,
      ),
      initialRoute: '/one',
      onGenerateRoute: (settings) {
        if (settings.name == '/one') {
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) {
              return const PageOne();
            },
          );
        }
        return MaterialPageRoute(
          builder: (_) => const PageTwo(),
          fullscreenDialog: true,
        );
      },
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('This a a route build via PageRouteBuilder'),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/two');
                },
                child: Text('Go to Page Two'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Two'),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Text('This a MaterialRoute with fullscreenDialog: true'),
        ),
      ),
    );
  }
}
