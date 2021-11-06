import 'package:dyma_trip/model/activity_model.dart';
import 'package:dyma_trip/model/location_activity_model.dart';
import 'package:dyma_trip/provider/city_provider.dart';
import 'package:dyma_trip/wigdet/activity_form_autocomplete.dart';
import 'package:dyma_trip/wigdet/activity_form_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  late FocusNode _addressFocusNode;
  bool _isLoading = false;
  late String? _nameInputAsync;
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

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
      location: LocationActivity(
        address: " ",
        latitude: 0,
        longitude: 0,
      ),
      status: ActivityStatus.toDo
    );
    _priceFocusNode = FocusNode();
    _urlFocusNode = FocusNode();
    _addressFocusNode = FocusNode();
    _nameInputAsync = null;
    _addressFocusNode.addListener(() async {
      if(_addressFocusNode.hasFocus){
        var location = await showInputAutoComplete(context);
        setState(() {
          print("Focus");
        });
        _urlFocusNode.requestFocus();
      }
      else{
        print("No focus");
      }
    });
    super.initState();
  }

  //----------------------------------------------------------------------------
  //----------------------- Destroy nodeFocus ----------------------------------
  //----------------------------------------------------------------------------

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _urlFocusNode.dispose();
    _urlController.dispose();
    _addressFocusNode.dispose();
    _addressController.dispose();
    super.dispose();
  }

  //----------------------------------------------------------------------------
  //----------------------- Submit form ----------------------------------------
  //----------------------------------------------------------------------------

  Future<void> submitForm() async {
    try {
      CityProvider cityProvider = Provider.of<CityProvider>(context, listen: false);
      _formKey.currentState!.save();
      setState(() => _isLoading = true);
      _nameInputAsync = await cityProvider.verifyIfActivityNameIsUnique(widget.cityName, _newActivity.name!);
      if(form!.validate()){
        await cityProvider.addActivityToCity(_newActivity);
        Navigator.pop(context);
      }
      else{
        setState(() => _isLoading = false);
      }
    } catch (e) {
      setState(() => _isLoading = false);
      print(e);
    }
  }

  //----------------------------------------------------------------------------
  //----------------------- Update url -----------------------------------------
  //----------------------------------------------------------------------------

  void updateUrlField(String url){
    setState(() {
      _urlController.text = url;
    });
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
                if(value == null || value.isEmpty) return "Remplissez le nom";
                else if(_nameInputAsync != null) return _nameInputAsync;
                return null;
              },
              textInputAction: TextInputAction.next,
              onSaved: (value) => _newActivity.name = value!,
              onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_priceFocusNode),
            ),
            SizedBox(height: 30,),
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
            SizedBox(height: 30,),
            TextFormField(
              focusNode: _addressFocusNode,
              controller: _addressController,
              decoration: InputDecoration(
                  hintText: "Adresse"
              ),
              onSaved: (value) => _newActivity.location!.address = value!,
            ),
            SizedBox(height: 30,),
            TextFormField(
              keyboardType: TextInputType.url,
              focusNode: _urlFocusNode,
              controller: _urlController,
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
            ),
            SizedBox(height: 10,),
            ActivityFormImagePicker(updateUrl: updateUrlField),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Annuler"),
                ),
                SizedBox(width: 30,),
                ElevatedButton(
                  onPressed: _isLoading ? null : submitForm,
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
