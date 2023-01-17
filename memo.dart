class Memo {
  final String color;
  final String memo;
  final String date;

  Memo({required this.color, required this.memo, required this.date});

  factory Memo.fromJson(Map<String, dynamic> json) {
    return Memo(
      color: (json['color']),
      memo: json['memo'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'color': color, 'memo': memo, 'date': date,};
}