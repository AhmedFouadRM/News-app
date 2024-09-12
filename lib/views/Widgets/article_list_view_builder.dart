import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/Widgets/article_list_view.dart';
import 'package:news_app/services/news_service.dart';
import 'package:dio/dio.dart';

class ArticleListViewBuilder extends StatefulWidget {
  const ArticleListViewBuilder({super.key, this.category});
  final String? category;

  @override
  State<ArticleListViewBuilder> createState() => _ArticleListViewBuilderState();
}

class _ArticleListViewBuilderState extends State<ArticleListViewBuilder> {
  var future;
  @override
  void initState() {
    future = NewsService(Dio()).getNews(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        Widget childern;
        if (snapshot.hasData) {
          childern = ArticleListView(articleList: snapshot.data!);
        } else if (snapshot.hasError) {
          childern = const SliverToBoxAdapter(
            child: SizedBox(
              child: Center(
                child: Text("error"),
              ),
            ),
          );
        } else {
          childern = const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return childern;
      },
    );
  }
}
