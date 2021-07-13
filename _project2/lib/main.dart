import 'package:_project2/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Retrofit Post Call"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: deprecated_member_use
            RaisedButton(
                child: const Text("Fetch Post"),
                onPressed: () => {
                      setState(() {
                        pressed = true;
                        //fetchData(postNum);
                      })
                    }),
            const Padding(padding: EdgeInsets.all(30)),
            pressed ? _showText(context) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

_showText(BuildContext context) {
  Provider.of<PostProvider>(context).postRequest();
  return Consumer(
    builder: (context, PostProvider _postProvider, _) {
      if (_postProvider.isError) {
        return const Center(
          child: Text("Retry again"),
        );
      }
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: unnecessary_null_comparison
            _postProvider.post == null
                ? const Text("Retry Again")
                : Text(
                    "Name :  ${_postProvider.post.name == "" ? "Retry Again" : _postProvider.post.name}",
                    style: const TextStyle(fontSize: 30),
                  ),
            // ignore: unnecessary_null_comparison
            _postProvider.post == null
                ? const Text("Retry Again")
                : Text(
                    "Age :  ${_postProvider.post.age == 0 ? "Retry Again" : _postProvider.post.age}",
                    style: const TextStyle(fontSize: 30),
                  ),
          ],
        ),
      );
    },
  );
}
