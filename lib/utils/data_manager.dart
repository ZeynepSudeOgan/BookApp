import 'package:db_project/models/category.dart';

class DataManager {
  static Future<List<Category>> getCategoryNames() async {
    return [
      Category(
          id: 1,
          name: "Fiction",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 2,
          name: "Non-fiction",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 3,
          name: "Mystery",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 4,
          name: "Science Fiction",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 5,
          name: "Fantasy",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 6,
          name: "Romance",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 7,
          name: "Historical Fiction",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 8,
          name: "Horror",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 9,
          name: "Biography",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 10,
          name: "Autobiography",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 11,
          name: "Self-help",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 12,
          name: "Travel",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 13,
          name: "Science",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
      Category(
          id: 14,
          name: "Philosophy",
          imageLink:
              "https://as1.ftcdn.net/v2/jpg/05/39/32/38/1000_F_539323873_442e0uaPcnBM6l4AOHj0gaaQ6SIPfKet.jpg"),
    ];
  }
}
