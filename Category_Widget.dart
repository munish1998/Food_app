import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foods_app/Models/Category_Model.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('categories').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error fetching categories: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final data = snapshot.data;
        if (data == null || data.docs.isEmpty) {
          return Center(
            child: Text("No categories found!"),
          );
        }

        return Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.docs.length,
            itemBuilder: (BuildContext context, int index) {
              final document = data.docs[index];
              final category = CategoriesModel1.fromMap(
                  document.data() as Map<String, dynamic>);

              final categoryId = category.categoryId ?? '';
              final categoryImg = category.categoryImg ?? '';
              final categoryName = category.categoryName ?? '';
              final createdAt = category.createdAt?.toString() ?? '';
              final updatedAt = category.updatedAt?.toString() ?? '';

              return Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        categoryImg,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 8),
                      Text(
                        categoryName,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
