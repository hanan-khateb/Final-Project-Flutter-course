import 'package:depression_treatment/generated/l10n.dart';
import 'package:depression_treatment/screens/HomePage.dart';
import 'package:depression_treatment/utils/FontsStyle.dart';
import 'package:flutter/material.dart';

class SignUpSecond extends StatefulWidget {
  static const id = "signupSecond";

  @override
  _SignUpSecondState createState() => _SignUpSecondState();
}

List doctorsName = [
  "محمد",
  "محمود",
  "رامي",
  "سمير",
  "محمود",
  "رامي",
  "سمير",
  "محمود",
  "رامي",
  "سمير",
  "محمود",
  "رامي",
  "سمير",
  "سمير",
  "محمود",
  "رامي"
];
String selectedDoctor = doctorsName[0];

class _SignUpSecondState extends State<SignUpSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 70,
                child: Center(
                    child: Text(S.of(context).Select_doctor,
                        style: FontsStyle.mainStyle)),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height - 300,
                child: ListView.builder(
                    itemCount: doctorsName.length,
                    itemBuilder: (BuildContext builder, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(doctorsName[index]),
                          subtitle: Text("Country / city / adress"),
                          leading: Radio(
                            value: doctorsName[index] + "$index",
                            groupValue: selectedDoctor,
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                selectedDoctor = value;
                              });
                            },
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.id);
                  },
                  child: Text(S.of(context).submit),
                ),
              ),
            ]),
      ),
    );
  }
}
