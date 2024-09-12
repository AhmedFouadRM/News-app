import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/Widgets/image_builder.dart';
import 'package:news_app/views/web_page.dart';

class Article extends StatelessWidget {
  const Article({super.key, required this.model});
  final ArticleModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>
                  WebPage(url: model.url, title: model.title)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 240,
                width: double.infinity,
                child: ImageBuilder(url: model.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                model.title,
                maxLines: 2,
                style: const TextStyle(fontSize: 25),
              ),
            ),
            Text(
              model.subTitle ?? '',
              maxLines: 2,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
