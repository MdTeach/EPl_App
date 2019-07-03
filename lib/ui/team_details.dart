import 'package:flutter/material.dart';
import 'package:pokem/modals/team.dart';

class TeamDetails extends StatelessWidget {
  final Team team;
  TeamDetails({this.team});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${team.teamName}"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body:
      Padding(
        padding: EdgeInsets.only(top: 35),
        child: Stack(
        children: <Widget>[
          Positioned(
            height: 400,
            left: 20,
            right: 20,
            top: 70,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(team.teamName,style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  Text("Estd on: ${team.estdDate.toString()}",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Text("${team.stadiumName}",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                ],
              ),          
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: team.imageUrl,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(team.imageUrl)
                  )
                ),
              ),
            ),
          ),
        ],
      ),
      ) 
    );
  }
}
