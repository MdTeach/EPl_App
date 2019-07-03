import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokem/modals/team.dart';
import 'package:pokem/ui/team_details.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
    title: "EPL",
  ));
}

  
class MyApp extends StatefulWidget{
  @override
  _MyAppState createState(){
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  TeamList teamList;
  @override
  void initState(){
    super.initState();
    print("Some eers");
    fetchData();
  }

  fetchData() async{
    http.Response res = await http.get(
      "https://api.football-data.org/v2/competitions/PL/teams",
      headers:{
        "X-Auth-Token":"32fb42b030554fef856ee1b60ea44e14"
      },
    );

    //print(json.decode(res.body.toString()));
    teamList = new TeamList.fromJson(json.decode(res.body.toString()));
    for(int i=0;i<20;i++){
      print("data "+i.toString()+"\n"+teamList.teams[i].imageUrl);
    }

    setState((){});
  }

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Premier League"),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        drawer: Drawer(),
        body:  teamList == null  
        ? Center(
          child: CircularProgressIndicator()
        )
        : Center(
          child: GridView.count(
            crossAxisCount: 2,
            children: teamList.teams.map(
              (team)=>Padding(
                padding: EdgeInsets.all(2.0),
                child:InkWell(
                  onTap: (){
                    print(team.toJson()["teamName"]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TeamDetails(team: team,)),
                    );
                  },
                  child:Hero(
                    tag: team.imageUrl.toString(),
                    
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            // height: MediaQuery.of(context).size.height*0.4,
                            // width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(team.imageUrl)
                              )
                            ),
                          ),
                          Text(
                            team.teamName,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ) 
              )
            ).toList(),
          ),
        )
    );
  }
}