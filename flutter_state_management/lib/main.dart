import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/application_color.dart';
import 'package:provider/provider.dart';

void main() => runApp(StateManagement());

class StateManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ApplicationColor>(
        builder: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Consumer<ApplicationColor>(
              builder: (context, applicationColor, _) => Text(
                'State Management',
                style: TextStyle(
                  color: applicationColor.color,
                ),
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<ApplicationColor>(
                builder: (context, applicationColor, _) => AnimatedContainer(
                margin: EdgeInsets.all(5),
                height: 100,
                width: 100,
                color: applicationColor.color,
                duration: Duration(milliseconds: 500),
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text("AB"),
                  ),
                  Consumer<ApplicationColor>(
                    builder: (context, applicationColor, _) => Switch(
                    value: applicationColor.isLightBlue,
                    onChanged: (newValue) {
                      applicationColor.isLightBlue = newValue;
                    },
                  ),    
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text("LB"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
