import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  int _counter = 0;
  String? language;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _add100Counter() {
    setState(() {
      _counter += 100;
    });
  }

  void _subtract100Counter() {
    setState(() {
      if (_counter > 0) {
        _counter -= 100;
      } else if (_counter == 0) {
        Fluttertoast.showToast(
            msg: 'Sudah 0 Bang :v',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      } else if (_counter == 0) {
        Fluttertoast.showToast(
            msg: 'Sudah 0 Bang :v',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: _incrementCounter, child: const Text('Tambah')),
            OutlinedButton(
                onPressed: _add100Counter, child: const Text('Tambah 100')),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            OutlinedButton(
                onPressed: _subtract100Counter,
                child: const Text('Kurangi 100')),
            TextButton(
                onPressed: _decrementCounter,
                child: const Text('Kurangi Angka di atas')),
            IconButton(
                onPressed: _decrementCounter,
                icon: const Icon(Icons.exposure_minus_1)),
            DropdownButton(
                items: const <DropdownMenuItem<String>>[
                  DropdownMenuItem<String>(
                    value: 'Dart',
                    child: Text('Dart'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Kotlin',
                    child: Text('Kotlin'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Swift',
                    child: Text('Swift'),
                  ),
                ],
                value: language,
                hint: const Text('Select Language'),
                onChanged: (String? value) {
                  setState(() {
                    language = value;
                    Fluttertoast.showToast(
                        msg: 'Anda memilih $value',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  });
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
