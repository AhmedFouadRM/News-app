import 'package:flutter/material.dart';
import 'package:news_app/views/Widgets/text_image.dart';
import 'package:news_app/models/category_model.dart';

List<CategoryModel> categoryList = const [
  CategoryModel(
      categoryName: 'business',
      image: "assets/business.avif",
      text: "Business"),
  CategoryModel(
      categoryName: 'entertainment',
      image: "assets/entertaiment.avif",
      text: "Entertaiment"),
  CategoryModel(
      categoryName: 'general', image: "assets/general.avif", text: "General"),
  CategoryModel(
      categoryName: 'health', image: "assets/health.avif", text: "Health"),
  CategoryModel(
      categoryName: 'science', image: "assets/science.avif", text: "Science"),
  CategoryModel(
      categoryName: 'sports', image: "assets/sports.avif", text: "Sports"),
  CategoryModel(
      categoryName: 'technology',
      image: "assets/technology.jpeg",
      text: "Technology"),
];

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        padding: const EdgeInsets.only(right: 16),
        itemBuilder: (BuildContext context, int index) {
          return Category(model: categoryList[index]);
        },
      ),
    );
  }
}
