import 'package:flutter/material.dart';
import 'Widgets/article_list_view_builder.dart';
import 'Widgets/category_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CategoryListView()),
          ArticleListViewBuilder(),
        ],
      ),
    );
  }
}
