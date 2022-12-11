import 'package:flutter/cupertino.dart';
import 'package:newspaper/src/models/news_models.dart';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  NewsService() {
    this.getTopHeadlines();
  }
  getTopHeadlines() {
    print('cargando headlines...');
  }
}
