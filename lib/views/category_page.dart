import 'package:flutter/material.dart';
import 'Widgets/article_list_view_builder.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage(this.category, {super.key});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'News'),
              TextSpan(text: 'Cloud', style: TextStyle(color: Colors.orange)),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          ArticleListViewBuilder(category: category),
        ],
      ),
    );
  }
}
