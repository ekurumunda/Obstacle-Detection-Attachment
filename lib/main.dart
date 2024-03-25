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
        title: 'Obstacle Detection Device App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    /*Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = SettingsPage();
        break;
      case 2:
        page = BluetoothPage();
        break;
      case 3:
        page = FallDetectionPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }*/
    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Object Detection', style: style),
          backgroundColor: Colors.cyan[700],
        ),
        body: Row(children: [
          Column(
            children: [
              SizedBox(width: 5),
            ],
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
//
                    // About Page
                    child: SizedBox(
                        width: 300,
                        height: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutPage()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.cyan[100]),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.white, width: 4.0),
                            )),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.telegram,
                                  size: 40.0,
                                ),
                                Text(
                                  'About',
                                  textAlign: TextAlign.center,
                                )
                              ]),
                        )),
                  ),

                  //Speech Feedback Button
                  Expanded(
                    child: SizedBox(
                      width: 300,
                      height: 120,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SpeechFeedbackPage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.cyan[100]),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white, width: 4),
                          )),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.voice_chat,
                                size: 40.0,
                              ),
                              Text(
                                'Speech Feedback',
                                textAlign: TextAlign.center,
                              )
                            ]),
                      ),
                    ),
                  ),
                  //
                  //
                  //Fall Detection Button
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FallDetectionPage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.cyan[100]),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white, width: 4),
                          )),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.warning,
                                size: 40.0,
                              ),
                              Text(
                                'Fall Detection',
                                textAlign: TextAlign.center,
                              )
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ]),
          ),

          //
          //
          // Second Column
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //
                //Emergency Contact Button
                Expanded(
                  child: SizedBox(
                    width: 300,
                    height: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmergencyContactPage()),
                        );
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.cyan[100]),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white, width: 4.0),
                        )),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.contact_emergency,
                              size: 40.0,
                            ),
                            Text(
                              'Emergency Contact \nInformation',
                              textAlign: TextAlign.center,
                            )
                          ]),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BluetoothPage()));
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.cyan[100]),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white, width: 4),
                        )),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.bluetooth,
                              size: 40.0,
                            ),
                            Text(
                              'Bluetooth',
                              textAlign: TextAlign.center,
                            )
                          ]),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BatteryPage()),
                        );
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.cyan[100]),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white, width: 4),
                        )),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.battery_5_bar,
                              size: 40.0,
                            ),
                            Text(
                              'Battery',
                              textAlign: TextAlign.center,
                            )
                          ]),
                    ),
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
          Column(
            children: [SizedBox(width: 5)],
          )
        ]
            /*SafeArea(
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
            */
            ),
      );
    });
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('About', style: style),
        backgroundColor: Colors.cyan,

        //elevation: 100.0,
      ),
      body: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Text('Insert description of device and capabilities')
          ] //children
          ),
    );
  }
}

class SpeechFeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Speech Feedback', style: style),
        backgroundColor: Colors.cyan,

        //elevation: 100.0,
      ),
      body: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                //appState.toggleVoiceAlert();
              },
              label: Text('Speech Alert'),
              icon: Icon(Icons.record_voice_over),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // appState.toggleLocationServices();
              },
              icon: Icon(Icons.map),
              label: Text('Turn Location on'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                //setState(() {
                //selectedIndex = value;
              },
              icon: Icon(Icons.warning),
              label: Text('Turn fall detection on'),
            ),
          ] //children
          ),
    );
  }
}

class FallDetectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Fall Detection', style: style),
        backgroundColor: Colors.cyan,

        //elevation: 100.0,
      ),
      body: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                //appState.toggleVoiceAlert();
              },
              label: Text('Speech Alert'),
              icon: Icon(Icons.record_voice_over),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // appState.toggleLocationServices();
              },
              icon: Icon(Icons.map),
              label: Text('Turn Location on'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                //setState(() {
                //selectedIndex = value;
              },
              icon: Icon(Icons.warning),
              label: Text('Turn fall detection on'),
            ),
          ] //children
          ),
    );
  }
}

class EmergencyContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contact Information', style: style),
        backgroundColor: Colors.cyan,

        //elevation: 100.0,
      ),
      body: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                //appState.toggleVoiceAlert();
              },
              label: Text('Speech Alert'),
              icon: Icon(Icons.record_voice_over),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // appState.toggleLocationServices();
              },
              icon: Icon(Icons.map),
              label: Text('Turn Location on'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                //setState(() {
                //selectedIndex = value;
              },
              icon: Icon(Icons.warning),
              label: Text('Turn fall detection on'),
            ),
          ] //children
          ),
    );
  }
}

class BatteryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Battery', style: style),
        backgroundColor: Colors.cyan,

        //elevation: 100.0,
      ),
      body: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                //appState.toggleVoiceAlert();
              },
              label: Text('Speech Alert'),
              icon: Icon(Icons.record_voice_over),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // appState.toggleLocationServices();
              },
              icon: Icon(Icons.map),
              label: Text('Turn Location on'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                //setState(() {
                //selectedIndex = value;
              },
              icon: Icon(Icons.warning),
              label: Text('Turn fall detection on'),
            ),
          ] //children
          ),
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

    return Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          AppBar(
            title: Text('Settings', style: style),
            backgroundColor: theme.colorScheme.primary,
            //elevation: 100.0,
          ),
          SizedBox(height: 100),
          Column(
            //mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  //appState.toggleVoiceAlert();
                },
                label: Text('Speech Alert'),
                icon: Icon(Icons.record_voice_over),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // appState.toggleLocationServices();
                },
                icon: Icon(Icons.map),
                label: Text('Turn Location on'),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  //setState(() {
                  //selectedIndex = value;
                },
                icon: Icon(Icons.warning),
                label: Text('Turn fall detection on'),
              ),
            ],
          )
        ]);
  }
}

class BluetoothPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('Bluetooth', style: style),
          backgroundColor: Colors.cyan,
        ),
        body: Column(
          children: [
            Text('Connect to bluetooth'),
          ],
        ));
  }
}

/*class FallDetectionPage extends StatelessWidget {
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
          SizedBox(height: 100),
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
}*/

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

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
          SizedBox(height: 100),
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

