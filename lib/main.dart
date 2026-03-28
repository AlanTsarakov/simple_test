import 'package:flutter/material.dart';
import 'package:simple_test/data/questions.dart';
import 'package:simple_test/models/question.dart';

void main() {
  runApp(const MyApp()); //точка входа. Создаем экземляр MyApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const QuizHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class QuizHomePage extends StatefulWidget
{
  const QuizHomePage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _QuizHomePageState();
  }
}

class _QuizHomePageState extends State<QuizHomePage>
{

  int _currentQuestionIndex = 0;

  int? _selectedOptionIndex;

  int _score = 0;

  bool _showResult = false;


  Question get _currentQuestion => sampleQuestions[_currentQuestionIndex];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QuizApp"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _showResult ? _buildResultScreen() : _buildQuestionScreen()
      );
  }
  
  Widget _buildResultScreen()
  {
    return Text(_currentQuestion.text);
  }
  
  Widget _buildQuestionScreen() 
  {
    // return Center(
    //   child: Text(_currentQuestion.text)
    // );
    return Column(
      children: [
        Center(
          child: Text(_currentQuestion.text)
        ),
        Expanded(
          child: 
            ListView.builder(
              itemBuilder: (BuildContext context, int item){
                return Padding(
                  padding: .all(10),
                  child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(101, 105, 128, 1)
                  ),
                  height: 50,
                  child: Center(child: Text(_currentQuestion.options[item])),
                ));
              },
              itemCount: _currentQuestion.options.length,
              ))
        
      ],
      );
  }



  void NextQuestion()
  {
    if (_selectedOptionIndex == null)
    {
      return;
    }
    else if (_currentQuestion.isCorrect(_selectedOptionIndex!))
    {
      setState(() {
        _currentQuestionIndex++;
        _score++;
      });
    }
    else{
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }
}


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(

//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,

//         title: Text(widget.title),
//       ),
//       body: Center(

//         child: Column(

//           mainAxisAlignment: .center,
//           children: [
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
