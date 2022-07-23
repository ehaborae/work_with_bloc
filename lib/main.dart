import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_with_bloc/bloc/bloc.dart';
import 'package:work_with_bloc/bloc/event.dart';
import 'package:work_with_bloc/bloc/state.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: const MaterialApp(
          home: CounterBlocDemo(),
          debugShowCheckedModeBanner: false,
        ));
  }
}

class CounterBlocDemo extends StatefulWidget {
  const CounterBlocDemo({Key? key}) : super(key: key);

  @override
  _CounterBlocDemoState createState() => _CounterBlocDemoState();
}

class _CounterBlocDemoState extends State<CounterBlocDemo> {
  late CounterBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<CounterBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text("Flutter Bloc 8.0.1 Design Pattern"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          bloc.add(IncrementEvent());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FlutterLogo(
            size: 100,
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, currentState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'You have pushed the button this many times:',
                        style:TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        currentState.counter.toString(),
                        style:const TextStyle(color: Colors.blueGrey,fontSize: 30),
                      ),
                    ],
                  ),
                );
            },
          ),
        ],
      ),
    );
  }
}