import 'package:depression_treatment/generated/l10n.dart';
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
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.grey[200],
              height: MediaQuery.of(context).size.height / 3,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              child: Text(S.of(context).Select_doctor),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView.builder(
                  itemCount: doctorsName.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(doctorsName[index]),
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
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height / 10,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(S.of(context).submit),
              ),
            )
          ],
        ));
  }
}
