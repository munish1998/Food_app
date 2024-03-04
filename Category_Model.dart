// import 'package:cloud_firestore/cloud_firestore.dart';

// class CategoriesModel1 {
//   final String categoryId;
//   final String categoryImg;
//   final String categoryName;
//   final dynamic createdAt;
//   final dynamic updatedAt;

//   CategoriesModel1({
//     required this.categoryId,
//     required this.categoryImg,
//     required this.categoryName,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   // Serialize the UserModel instance to a JSON map
//   Map<String, dynamic> toMap() {
//     return {
//       'categoryId': categoryId,
//       'categoryImg': categoryImg,
//       'categoryName': categoryName,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//     };
//   }

//   // Create a UserModel instance from a JSON map
//   factory CategoriesModel1.fromMap(Map<String, dynamic> json) {
//     return CategoriesModel1(
//       categoryId: json['categoryId'],
//       categoryImg: json['categoryImg'],
//       categoryName: json['categoryName'],
//       createdAt: json['createdAt'],
//       updatedAt: json['updatedAt'],
//     );
//   }

//   // Method to fetch categories from Firestore
//   static Future<List<CategoriesModel1>> fetchCategories() async {
//     try {
//       final QuerySnapshot<Map<String, dynamic>> querySnapshot =
//           await FirebaseFirestore.instance.collection('categories').get();

//       final List<CategoriesModel1> categories = querySnapshot.docs.map((doc) {
//         return CategoriesModel1(
//           categoryId: doc['categoryId'] ?? '',
//           categoryImg: doc['categoryImg'] ?? '',
//           categoryName: doc['categoryName'] ?? '',
//           createdAt: doc['createdAt'],
//           updatedAt: doc['updatedAt'],
//         );
//       }).toList();

//       return categories;
//     } catch (e) {
//       // Handle error if fetching data fails
//       print('Error fetching categories: $e');
//       throw Exception('Failed to fetch categories');
//     }
//   }
// }

class CategoriesModel1 {
  final String categoryId;
  final String categoryImg;
  final String categoryName;
  final dynamic createdAt;
  final dynamic updatedAt;

  CategoriesModel1({
    required this.categoryId,
    required this.categoryImg,
    required this.categoryName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoriesModel1.fromMap(Map<String, dynamic>? json) {
    if (json == null)
      return CategoriesModel1(
        categoryId: '',
        categoryImg: '',
        categoryName: '',
        createdAt: null,
        updatedAt: null,
      );

    return CategoriesModel1(
      categoryId: json['categoryId'] ?? '',
      categoryImg: json['categoryImg'] ?? '',
      categoryName: json['categoryName'] ?? '',
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
