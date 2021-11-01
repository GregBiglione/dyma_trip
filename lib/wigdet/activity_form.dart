import 'package:dyma_trip/model/activity_model.dart';
import 'package:flutter/material.dart';

class ActivityForm extends StatefulWidget {
  final String cityName;

  const ActivityForm({Key? key, required this.cityName}) : super(key: key);

  @override
  _ActivityFormState createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late Activity newActivity;

  //----------------------------------------------------------------------------
  //----------------------- Get form state -------------------------------------
  //----------------------------------------------------------------------------

  FormState? get form {
    return _formKey.currentState;
  }

  //----------------------------------------------------------------------------
  //----------------------- Initialize new activity in initState ---------------
  //----------------------------------------------------------------------------

  @override
  void initState() {
    newActivity = Activity(
      name: null,
      image: null,
      city: widget.cityName,
      price: 0,
      status: ActivityStatus.toDo
    );
    super.initState();
  }

  //----------------------------------------------------------------------------
  //----------------------- Submit form ----------------------------------------
  //----------------------------------------------------------------------------

  void submitForm() {
    if(form!.validate()){
      _formKey.currentState!.save();
    }
    else{
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Nom",
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Remplissez le nom";
                }
                return null;
              },
              onSaved: (value) => newActivity.name = value!,
            ),
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Prix",
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Remplissez le prix";
                }
                return null;
              },
              onSaved: (value) => newActivity.price = double.parse(value!),
            ),
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                hintText: "Url",
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Remplissez l'url";
                }
                return null;
              },
              onSaved: (value) => newActivity.image = value!,
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
                  onPressed: submitForm,
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
