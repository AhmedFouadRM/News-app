import 'package:flutter/material.dart';
import 'package:news_app/views/Widgets/article.dart';
import 'package:news_app/models/article_model.dart';

class ArticleListView extends StatelessWidget {
  const ArticleListView({super.key, required this.articleList});
  final List<ArticleModel> articleList;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return Article(model: articleList[index]);
      },
      itemCount: articleList.length,
    );
  }
}
