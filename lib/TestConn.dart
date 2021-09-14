import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestConn extends StatefulWidget {
  static const id = "TestConn";
  @override
  _TestConnState createState() => _TestConnState();
}

class _TestConnState extends State<TestConn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("conn"),
          onPressed: () {},
        ),
      ),
    );
  }

  Future<void> loginPost() {
    print("hello");
    var resp = http.post(Uri.tryParse("http://192.168.1.108:5555/"), body: {});
    print("getttttttttt respon");
    resp.then((value) => print(value.body));
  }
}
