import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newspaper/src/models/category_model.dart';
import 'package:newspaper/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _urlNews = 'https://newsapi.org/v2';
final _apiKey = '431a2b39236d43baaafbf67530faa12d';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sport'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];
  NewsService() {
    getTopHeadlines();
  }
  getTopHeadlines() async {
    final url = Uri.parse('$_urlNews/top-headlines?apiKey=$_apiKey&country=us');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
