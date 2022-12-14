
class Story {
  final int id;

  final bool deleted;

  final String type;

  final String by;

  final int time;

  final bool dead;

  final List<dynamic> kids;

  final int descendants;

  final int score;

  final String title;

  final String url;

  Story({
    required this.id,
    required this.deleted,
    required this.type,
    required this.by,
    required this.time,
    required this.dead,
    required this.kids,
    required this.descendants,
    required this.score,
    required this.title,
    required this.url,
  });

  factory Story.fromJson(json) => Story(
        id: json['id'],
        deleted: json['deleted'] ?? false,
        type: json['type'],
        by: json["by"],
        time: json["time"],
        dead: json["dead"] ?? false,
        descendants: json["descendants"] ?? 0,
        score: json["score"],
        title: json["title"],
        url: json["url"] ?? 'null',
        kids: json["kids"]?.cast<int>() ?? [],
      );
}
class Comment {
  final int id;

  final String text;

  final String by;

  final String type;

  final int parent;

  final int time;

  final bool dead;

  final bool deleted;

  final List<dynamic> kids;

  Comment({
    required this.id,
    required this.text,
    required this.by,
    required this.type,
    required this.parent,
    required this.time,
    required this.dead,
    required this.deleted,
    required this.kids,
  });

  factory Comment.fromJson(json) {
    return Comment(
      id: json['id'],
      text: json["text"],
      by: json['by'],
      type: json['type'],
      parent: json['parent'],
      time: json['time'],
      dead: json['dead'] ?? false,
      deleted: json['deleted'] ?? false,
      kids: json['kids']?.cast<int>() ?? [],
    );
  }
}
