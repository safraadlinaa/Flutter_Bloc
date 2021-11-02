import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyCounter());
}

class MyCounter extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CounterApp'),
        leading: Icon(Icons.home), //link to home page
      ),      
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) => Center(
          child: Text('Counter: $count',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
        ),),), 
      ),
      
      floatingActionButton: Column(        
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
            ),            
          ),
          SizedBox(height: 5,),
          Container(
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () => context.read<CounterCubit>().decrement(),
            ),
          ), 
          ],
        ),
        
//          Container(
//             child: ElevatedButton(                  
//                 onPressed: (){
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => MyApp()),
//                   );
//                 }, child: Text('Home Page'),
//               ),
//           )     , 

        
    );
  }
}
