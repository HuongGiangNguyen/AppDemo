class RankModel {
  List<This> tthis;
  List<This> before;

  RankModel({this.tthis, this.before});

  RankModel.fromJson(Map<String, dynamic> json) {
    if (json['this'] != null) {
      tthis = new List<This>();
      json['this'].forEach((v) {
        tthis.add(new This.fromJson(v));
      });
    }
    if (json['before'] != null) {
      before = new List<This>();
      json['before'].forEach((v) {
        before.add(new This.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tthis != null) {
      data['this'] = this.tthis.map((v) => v.toJson()).toList();
    }
    if (this.before != null) {
      data['before'] = this.before.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class This {
  int ranking;
  int userId;
  String avatar;
  String name;
  int total;

  This({this.ranking, this.userId, this.avatar, this.name, this.total});

  This.fromJson(Map<String, dynamic> json) {
    ranking = json['ranking'];
    userId = json['user_id'];
    avatar = json['avatar'];
    name = json['name'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ranking'] = this.ranking;
    data['user_id'] = this.userId;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['total'] = this.total;
    return data;
  }
}
