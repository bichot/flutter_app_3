import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/Place/ui/widgets/title_input_location.dart';
import 'package:flutter_app_3/widgets/gradient_back.dart';
import 'package:flutter_app_3/widgets/text_input.dart';
import 'package:flutter_app_3/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget{

  File image;
  AddPlaceScreen({Key key, this.image});

  @override
  createState() {
    return _AddPlaceScreen();
  }
  
  
  
}

class _AddPlaceScreen extends  State<AddPlaceScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final _controlerTitlePlace = TextEditingController();
    final _controlerDescriptionPlace = TextEditingController();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: 300.0),
          Row(//App Bar
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0,left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left,color: Colors.white,size: 45),
                    onPressed: (){
                      Navigator.pop(context);
                    }
                  ),
                ),
              ),
                  Flexible(
                  child: Container(
                    padding: EdgeInsets.only(top: 45.0,left: 20.0,right: 20.0),
                    child: TitleHeader(title: "Add a new Place")
                  ))

            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.9, bottom: 20.0),
            child: ListView(
              children:<Widget> [
                Container(),//Foto
                Container(//TextField Title
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    maxLines: 1,
                    controller: _controlerTitlePlace,
                  ),
                ),
                TextInput(
                    hintText: "Description",
                    inputType: TextInputType.multiline,
                    maxLines: 4,
                    controller: _controlerDescriptionPlace
                ),
                Container(
                  margin: EdgeInsets.only(top:20.0),
                  child: TextInputLocation(
                    hintText: "Add Location",
                    iconData: Icons.location_on,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  
  
}