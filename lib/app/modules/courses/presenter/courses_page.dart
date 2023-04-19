// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_modular_with_mobx/app/modules/home/presenter/home_controller.dart';

// class HomePage extends StatefulWidget {
//   final String title;
//   const HomePage({Key? key, required this.title}) : super(key: key);
//   @override
//   State<HomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<HomePage> {
//   final controller = Counter(); // Instantiate the store
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.next_plan),
//               onPressed: () => Modular.to.navigate('/product'),
//             )
//           ],
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text('You have pushed the button this many times:'),
//               // Wrapping in the Observer will automatically re-render on changes to controller.value
//               Observer(
//                 builder: (_) => Text('${controller.value}',
//                     style: Theme.of(context).textTheme.headline4),
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//             onPressed: controller.increment,
//             tooltip: 'Increment',
//             child: Icon(Icons.add)));
//   }
// }
