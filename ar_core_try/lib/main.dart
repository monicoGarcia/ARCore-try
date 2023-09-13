import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
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
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  late ArCoreController arCoreController;
  _onArCoreViewCreated(ArCoreController _arCoreController){
    arCoreController=_arCoreController;
    _addSphere(_arCoreController);
  }



  _addSphere(ArCoreController _arCoreController){
    final material= ArCoreMaterial(color:Colors.deepOrange);
    final sphere = ArCoreSphere(materials: [material],radius: 2.0);
    final node = ArCoreNode(shape:sphere,position: vector.Vector3(0,0,-1));

    
  _arCoreController.addArCoreNode(node);
  }
  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated,)
    );
  }
}
