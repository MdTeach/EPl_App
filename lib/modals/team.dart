List<String> images = [
  "https://upload.wikimedia.org/wikipedia/en/thumb/5/53/Arsenal_FC.svg/270px-Arsenal_FC.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/f/f9/Aston_Villa_FC_crest_%282016%29.svg/225px-Aston_Villa_FC_crest_%282016%29.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/c/cc/Chelsea_FC.svg/300px-Chelsea_FC.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/7/7c/Everton_FC_logo.svg/330px-Everton_FC_logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/0/0c/Liverpool_FC.svg/270px-Liverpool_FC.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Manchester_City_FC_badge.svg/300px-Manchester_City_FC_badge.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/330px-Manchester_United_FC_crest.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Newcastle_United_Logo.svg/300px-Newcastle_United_Logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/8/8c/Norwich_City.svg/225px-Norwich_City.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/b/b4/Tottenham_Hotspur.svg/210px-Tottenham_Hotspur.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/f/fc/Wolverhampton_Wanderers.svg/300px-Wolverhampton_Wanderers.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/6/62/Burnley_F.C._Logo.svg/270px-Burnley_F.C._Logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/2/2d/Leicester_City_crest.svg/330px-Leicester_City_crest.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/c/c9/FC_Southampton.svg/270px-FC_Southampton.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/e/e2/Watford.svg/285px-Watford.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/0/0c/Crystal_Palace_FC_logo.svg/255px-Crystal_Palace_FC_logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/9/9c/Sheffield_United_FC_logo.svg/330px-Sheffield_United_FC_logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/f/fd/Brighton_%26_Hove_Albion_logo.svg/300px-Brighton_%26_Hove_Albion_logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/c/c2/West_Ham_United_FC_logo.svg/278px-West_Ham_United_FC_logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/OFFICIALBournemouthFC.png/255px-OFFICIALBournemouthFC.png"
];

class Team{
  String teamName;
  String imageUrl;
  int estdDate;
  String stadiumName;

  Team({
    this.teamName,
    this.imageUrl,
    this.estdDate,
    this.stadiumName
  });

  Team.fromJson(Map<String,dynamic> jsonData){
    teamName = jsonData["shortName"];
    imageUrl = jsonData["crestUrl"];
    estdDate = jsonData["founded"];
    stadiumName = jsonData["venue"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teamName'] = this.teamName;
    data['imageUrl'] = this.imageUrl;
    data['estdDate'] = this.estdDate;
    data['stadiumName'] = this.stadiumName;
    
    return data;
  }
}

class TeamList{
  List<Team> teams;

  TeamList(this.teams);

  TeamList.fromJson(Map<String,dynamic> json){
    teams = List<Team>();
    for(int counter=0; counter<json["teams"].length;counter++){
      Map newData = json["teams"][counter];
      newData["crestUrl"] = images[counter];
      teams.add(new Team.fromJson(newData));
    }
  }
}