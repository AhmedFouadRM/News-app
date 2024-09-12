import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  NewsService(this.dio);
  final Dio dio;
  Future<List<ArticleModel>> getNews({String? category}) async {
    String url;
    if (category == null) {
      url =
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=aed5bb4f73da404e88dd3163bda6dde0';
    } else {
      url =
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=aed5bb4f73da404e88dd3163bda6dde0';
    }
    Response response = await dio.get(url);
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
    List<ArticleModel> articleList = articles
        .map(
          (article) => ArticleModel(
              image: article['urlToImage'],
              title: article['title'],
              subTitle: article['description'],
              url: article['url']),
        )
        .toList();
    return articleList;
  }
}
