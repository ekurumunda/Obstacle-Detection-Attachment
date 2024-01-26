import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Obstacle Detection Deveice App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = SettingsPage();
        break;
      case 2:
        page = NavigationPage();
        break;
      case 3:
        page = FallDetectionPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text('Settings'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.map),
                    label: Text('Navigation'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.warning),
                    label: Text('Fall Detection'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorite = appState.favorites;
    if (favorite.isEmpty)
      return Center(
        child: Text('No favorites yet'),
      );
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'You have ' '${favorite.length}  favorites:',
            style: style,
          ),
        ),
        for (var fav in favorite)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(fav.asLowerCase),
          ),
      ],
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    //IconData icon;
    //icon = Icons.favorite_border;
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
              color: theme.colorScheme.primary,
              elevation: 100.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Settings',
                  style: style,
                ),
              )),
          SizedBox(height: 100),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  //appState.toggleVoiceAlert();
                },
                label: Text('Speech Alert'),
                icon: Icon(Icons.record_voice_over),
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {
                  // appState.toggleLocationServices();
                },
                icon: Icon(Icons.map),
                label: Text('Turn Location on'),
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {
                  //setState(() {
                  //selectedIndex = value;
                },
                icon: Icon(Icons.warning),
                label: Text('Turn fall detection on'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  appState.toggleFavorite();
                },
                child: Text('Say destination'),
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}

class FallDetectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Center(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Card(
              color: theme.colorScheme.primary,
              elevation: 100.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Fall Detection',
                  style: style,
                ),
              )),
          SizedBox(height: 100),
          //BigCard(pair: pair),
          //SizedBox(height: 10),
        ]));
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final style2 = theme.textTheme.bodyLarge!.copyWith(
      color: theme.colorScheme.onBackground,
    );

    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
              color: theme.colorScheme.primary,
              elevation: 100.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Welcome to "Object Detection Device"',
                  style: style,
                ),
              )),
          Text(
            'Easily navigate with tools such as speech alerts, fall detectiona and GPS navigation',
            style: style2,
          )
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
        color: theme.colorScheme.primary,
        elevation: 100.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            pair.asLowerCase,
            style: style,
            //semanticsLabel: "${pair.first} ${pair.second}",
          ),
        ));
  }
}
