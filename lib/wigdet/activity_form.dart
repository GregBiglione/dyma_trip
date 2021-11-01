import 'package:flutter/material.dart';

class ActivityForm extends StatefulWidget {
  const ActivityForm({Key? key}) : super(key: key);

  @override
  _ActivityFormState createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final GlobalKey formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Nom",
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Prix",
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Url",
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Annuler"),
                ),
                SizedBox(width: 30,),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Sauvegarder"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
