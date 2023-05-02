import 'package:flutter/material.dart';
import 'package:forms/input_base.dart';
import 'package:forms/mixins/form_mixins.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Forms'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(
                label: 'Name',
                customValidators: const[Validators.isNotEmpty, Validators.leastFiveChars],
                icon: Icons.person,
              ),
              const SizedBox(height: 20,),
              CustomTextField(
                label: 'Password',
                customValidators: const[Validators.isNotEmpty, Validators.leastFiveChars],
                obscureText: true,
                icon: Icons.key_sharp,
              ),
              const SizedBox(height: 45),
              SizedBox(
                width: double.infinity,
                height: 35,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.save_as_rounded),
                  label: const Text('Save')
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
