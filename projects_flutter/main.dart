import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      color: Colors.black,
      home: MyHomePage(title: 'To-Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '';
  final liste = [];

  final fieldText = TextEditingController();

  void clearTextField() {
    fieldText.clear();
    text = '';
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAE9E9),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: appBody(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.black,
        child: Container(
          height: 45,
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff000000),
        onPressed: () {
          setState(() {
            if (text.isNotEmpty) {
              liste.add(text);
              clearTextField();
            } else {
              liste.remove(liste);
            }
            print(liste);
          });
        },
        child: const Icon(
          Icons.add,
          color: Color(0xffffffff),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget appBody() {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: toDoAddTextField(),
          ),
          Expanded(
            child: toDoContent(),
          ),
        ],
      ),
    );
  }

  Widget toDoAddTextField() {
    return TextField(
      controller: fieldText,
      onChanged: (value) {
        text = value;
      },
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(
          color: Color(0xff020202),
        ),
        border: const OutlineInputBorder(),
        labelText: 'Yapılacaklar listesine ekle',
        contentPadding:
            const EdgeInsets.only(left: 20.0, bottom: 8.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(25.7),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(25.7),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear), // clear text
          onPressed: clearTextField,
        ),
      ),
    );
  }

  Widget toDoContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: liste.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
            child: Card(
              color: const Color(0xffc2c2c2),
              elevation: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.lens,
                          size: 10,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Expanded(
                        flex: 13,
                        child: ListTile(
                          title: Text(
                            '${liste[index]}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: IconButton(
                          alignment: Alignment.centerRight,
                          onPressed: () {
                            setState(() {
                              liste.removeAt(index);
                              print(liste);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
//Color(0xffffc729)
