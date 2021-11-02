import 'package:bloc_exercise/feature/feature-cubit.dart';
import 'package:bloc_exercise/main-pg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyInputApp());

class MyInputApp extends StatelessWidget {
  const MyInputApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => FeatureCubit(),
          child: MyCustomForm(),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();
  String _input = "";

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Widget'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<FeatureCubit, String>(
              bloc: context.read<FeatureCubit>(),
              builder: (context, state) {
                return Container(
                  width: 400,
                  height: 500,
                  child: Column(
                    children: [
                      Form(                          
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(30),
                              child: TextFormField(
                                style: TextStyle(
                                  fontSize: 20
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(),                                    
                                  labelText: "Enter Text",
                                  hintText: 'Type something!',                                    
                                ),
                                onChanged: (String value) => _input = value,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),                                
                              child: ElevatedButton(                                  
                                child: Text('Display Result',
                                style: TextStyle(
                                  fontSize: 20
                                ),),
                                onPressed: () {
                                  context.read<FeatureCubit>().accetpInput(_input);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(30),
                              child: Column(                                  
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text('The word you typed:',                                  
                                      style: TextStyle(
                                      fontSize: 20,                                    
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                    '$state',                                      
                                    style: TextStyle(
                                      fontSize: 20
                                    ),),
                                  )
                                ],
                              ),
                            )
                          ],                          
                        )
                      )
                    ]),
                );
              }),
              ElevatedButton(                  
                onPressed: (){
                  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                }, child: Text('Home Page'),
              )
          ],
        ),
      ),
    );
  }
}
