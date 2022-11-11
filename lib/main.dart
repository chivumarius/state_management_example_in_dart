import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

// (0) The "MyApp" Class:
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ♦ Using the "ChangeNotifierProvider" Package for "State Management":
    return ChangeNotifierProvider<Data>(
      // ♦ Returning "Valid Data" for "All Children":
      create: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const MyText(),
          ),
          body: const Level1(),
        ),
      ),
    );
  }
}

// (1) The "Level1" Class:
class Level1 extends StatelessWidget {
  // ♦ Constructor:
  const Level1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Level2(),
    );
  }
}

// (2) The "Level2" Class:
class Level2 extends StatelessWidget {
  // ♦ Constructor:
  const Level2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

// (3) The "Level3" Class:
class Level3 extends StatelessWidget {
  // ♦ Constructor:
  const Level3({super.key});

  @override
  Widget build(BuildContext context) {
    // ♦ We Ask the "Provider" to Give Us ".data" Property
    //    → Only in "Level3":
    return Text(Provider.of<Data>(context).data);
  }
}

// (4) The "MyText" Class:
class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ♦ We Ask the "Provider" to Give Us ".data" Property
    //    → Only in "Level3":
    return Text(Provider.of<Data>(context).data);
  }
}

// (5) The "MyTextField" Class:
class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        // ♦ We Ask the "Provider" to Call ".changeString" Method
        //    → from the "Data" Class
        //    → to Give Us the "newText" Property:
        Provider.of<Data>(context, listen: false).changeString(newText);
      },
    );
  }
}

// (6) The "Data" Class:
class Data extends ChangeNotifier {
  // ♦ Property:
  String data = 'Some data';

  // ♦ The "changeString" Method:
  void changeString(String newString) {
    data = newString;

    // ♦ Calling "notifyListeners()" Method
    //   → so that Anyone "Listening" to the "Provider"
    //   → can also "Rebuild" the "Widget":
    notifyListeners();
  }
}
