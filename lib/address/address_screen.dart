import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutterassignment/widgets/my_textfield.dart';

import '../app_constants.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {

  ///form-key
  final _formKey = GlobalKey<FormState>();

  ///text controllers
  final _country = TextEditingController();
  final _prefecture = TextEditingController();
  final _municipality = TextEditingController();
  final _streetAddress = TextEditingController();
  final _apartment = TextEditingController();

  ///flag for enabling/disabling button
  bool _disableBtn = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(widget.title),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(4.0), // Adjust the height as needed
            child: LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey, // Customize the background color
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent), // Customize the progress color
            ),
          ),
          leading: InkResponse(
            onTap: ()=>Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios_new_outlined, size: 14,)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Please enter information as written\non your ID document',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 30,),
                          MyTextField(hintText: 'Country',
                          controller: _country,
                          suffixIcon: Icon(Icons.search, color: Colors.grey, size: 20,),
                            enabled: false,
                            onTap: (){
                              _showPicker();
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                      MyTextField(hintText: 'Prefecture', controller: _prefecture,onChanged: (value){
                        setState(() {
                          _prefecture.text = value;
                          enableButton();
                        });
                      },),
                          const SizedBox(
                            height: 10,
                          ),
                          MyTextField(hintText: 'Municipality', controller: _municipality, onChanged: (value){
                            setState(() {
                              _municipality.text = value;
                              enableButton();
                            });
                          },),
                          const SizedBox(
                            height: 10,
                          ),
                          MyTextField(hintText: 'Street address', controller: _streetAddress, onChanged: (value){
                            setState(() {
                              _streetAddress.text = value;
                              enableButton();
                            });
                          },),
                          const SizedBox(
                            height: 10,
                          ),
                          MyTextField(hintText: 'Apartment, suite or unit', controller: _apartment, onChanged: (value){
                            setState(() {
                              _apartment.text = value;
                              enableButton();
                            });
                          },),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                IgnorePointer(
                  ignoring: _disableBtn,
                  child: Opacity(
                    opacity: _disableBtn ? 0.3 : 1,
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your button click logic here
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30.0), // Adjust the value as needed
                          ),
                        ),
                        child: const Text('Next'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }


  ///enables/disables button based on user's input
  enableButton(){
    if(_country.text.isNotEmpty && _prefecture.text.isNotEmpty && _municipality.text.isNotEmpty && _streetAddress.text.isNotEmpty && _apartment.text.isNotEmpty){
      _disableBtn = false;
    }else{
      _disableBtn = true;
    }
  }

  ///shows country picker and flags
  _showPicker(){
    showCountryPicker(
      context: context,
      exclude: <String>['KN', 'MF'],
      favorite: <String>['SE'],
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          _country.text = country.name;
          enableButton();
        });
      },
      // Optional. Sets the theme for the country list picker.
      countryListTheme: CountryListThemeData(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        // Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
        // Optional. Styles the text in the search field
        searchTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: 18,
        ),
      ),
    );
  }




}
