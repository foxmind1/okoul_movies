class Cast {
  int? id;
  String? name;
  String? profilePath;
  String? character;

  Cast({
    this.id,
    this.name,
    this.profilePath,
    this.character,
  });

  Cast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePath = json['profile_path'];
    character = json['character'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['original_name'] = name;
    data['profile_path'] = profilePath;
    data['character'] = character;
    return data;
  }
}
