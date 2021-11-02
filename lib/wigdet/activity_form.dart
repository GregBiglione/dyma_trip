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
  late Activity _newActivity;
  late FocusNode _priceFocusNode;
  late FocusNode _urlFocusNode;

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
    _newActivity = Activity(
      name: null,
      image: null,
      city: widget.cityName,
      price: 0,
      status: ActivityStatus.toDo
    );
    _priceFocusNode = FocusNode();
    _urlFocusNode = FocusNode();
    super.initState();
  }

  //----------------------------------------------------------------------------
  //----------------------- Destroy nodeFocus ----------------------------------
  //----------------------------------------------------------------------------

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _urlFocusNode.dispose();
    super.dispose();
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
              autofocus: true,
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
              textInputAction: TextInputAction.next,
              onSaved: (value) => _newActivity.name = value!,
              onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_priceFocusNode),
            ),
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.number,
              focusNode: _priceFocusNode,
              decoration: InputDecoration(
                hintText: "Prix",
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Remplissez le prix";
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              onSaved: (value) => _newActivity.price = double.parse(value!),
              onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_urlFocusNode),
            ),
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.url,
              focusNode: _urlFocusNode,
              decoration: InputDecoration(
                hintText: "Url image",
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Remplissez l'url";
                }
                return null;
              },
              onSaved: (value) => _newActivity.image = value!,
              onFieldSubmitted: (_) => submitForm,
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
