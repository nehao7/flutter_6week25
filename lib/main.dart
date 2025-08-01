import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_6week25/LoginScreen.dart';
import 'package:flutter_6week25/RegisterScreen.dart';
import 'package:flutter_6week25/BottomNavBarWithBarItems.dart';
import 'package:flutter_6week25/BottomNavigationColmRow.dart';
import 'package:flutter_6week25/BottomSheetSpacerAlignScreen.dart';
import 'package:flutter_6week25/ButtonTypesScreen.dart';
import 'package:flutter_6week25/CameraAndGalleryAcessScreen.dart';
import 'package:flutter_6week25/DataPassingScreen.dart';
import 'package:flutter_6week25/DateTimePickerScreen.dart';
// import 'package:flutter_6week25/DragAndZoomScreen.dart';
import 'package:flutter_6week25/DrawerLayoutScreen.dart';
import 'package:flutter_6week25/DropdownMenu2dArray.dart';
import 'package:flutter_6week25/FirestoreListCrud.dart';
import 'package:flutter_6week25/GestureDetectorScreen.dart';
// import 'package:flutter_6week25/GridViewScreen.dart';
import 'package:flutter_6week25/ListViewWithCustomScroll.dart';
import 'package:flutter_6week25/MyFormFields.dart';
import 'package:flutter_6week25/SliverAppBarScreen.dart';
import 'package:flutter_6week25/TextProperties_Widgets.dart';
import 'package:flutter_6week25/ToDoApp.dart';
import 'package:flutter_6week25/ZoomScreen.dart';
import 'package:flutter_6week25/expandedrowscreen.dart';
import 'package:flutter_6week25/ui_components.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      locale: const Locale('hi'), // If using a custom locale
      supportedLocales: const [
        Locale('en'),
        Locale('hi'), // Add more if needed
      ],
      localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String returnedData = 'No data yet';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void navigateAndReceiveData() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DataPassingScreen(mydata: 'Hello from First Screen'),
      ),
    );

    // Update state with returned data
    if (result != null) {
      setState(() {
        returnedData = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:SingleChildScrollView(
      child: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UiComponents()),
                );
              },
              child: Text("Screen 2"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExpandedRowScreen()),
                );
              },
              child: Text("Expanded Row"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TextProperties_Widgets()),
                );
              },
              child: Text("Text Widgets & Properties"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ButtonTypesScreen()),
                );
              },
              child: Text("Button Types"),
            ),
            SizedBox(height: 10),
            Text('Returned Data: $returnedData'),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: navigateAndReceiveData,
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DataPassingScreen(mydata: "Hello from first screen",)),
                // );

              child: Text("Data Passing"),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomSheetSpacerAlignScreen()));
              },

              child: Text("BottomSheet Screen"),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyFormFields()));
              },

              child: Text("Form Fields Screen"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DropdownMenu2dArray()));
              },

              child: Text("Dropdown Menu 2d Array"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DrawerLayoutScreen()));
              },

              child: Text("Drawer Layout"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationColmRow()));
              },

              child: Text("Bottom Navigation with Row & Column"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavbarWithBarItems()));
              },

              child: Text("Bottom Navigation & Tab items"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DatetimePickerScreen()));
              },

              child: Text("Date Picker"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CameraAndGalleryAcessScreen()));
              },

              child: Text("Gallery & Camera access"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => GestureDetectorScreen()));
              },

              child: Text("Gesture Detector"),
            ),
            // ElevatedButton(
            //   onPressed: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => DragAndZoomScreen()));
            //   },
            //
            //   child: Text("Drag Screen"),
            // ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewWithCustomScroll()));
              },

              child: Text("List view Crud"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
              },

              child: Text("Register Screen"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },

              child: Text("Login Screen"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FireStoreListCrud()));
              },
              child: Text("Firestore CRUD"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SliverAppBarScreen()));
              },

              child: Text("Sliver Appbar"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ZoomScreen()));
              },
              child: Text("Zoom Screen"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ToDoApp()));
              },
              child: Text("SQFLite ToDoApp"),
            ),

          ],
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
