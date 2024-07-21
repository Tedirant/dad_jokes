class JokeResponse {
  String? id;
  String? joke;
  int? status;

  JokeResponse({this.id, this.joke, this.status});

  JokeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    joke = json['joke'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['joke'] = joke;
    data['status'] = status;
    return data;
  }
}
