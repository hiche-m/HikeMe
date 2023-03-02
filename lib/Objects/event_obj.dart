class EventObj {
  int eventId;
  String destination;
  String state;
  int groupId;
  String groupName;
  String groupImg;
  int type;
  double price;
  DateTime startDate;
  DateTime endDate;
  String img;
  int rateCount;
  double rating;
  double difficulty;
  double distance;
  int maxSeats;
  int reservedSeats;

  EventObj({
    required this.eventId,
    required this.destination,
    required this.state,
    required this.groupId,
    required this.groupName,
    this.groupImg = "NULL",
    required this.type,
    required this.price,
    required this.startDate,
    required this.endDate,
    this.img = "NULL",
    this.rateCount = 0,
    this.rating = 0,
    this.difficulty = 0,
    this.distance = 0,
    this.maxSeats = 0,
    this.reservedSeats = 0,
  });
}
