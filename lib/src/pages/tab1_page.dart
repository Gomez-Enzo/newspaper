import 'package:flutter/material.dart';
import 'package:newspaper/src/services/news_services.dart';
import 'package:newspaper/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatelessWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return Scaffold(
      body: ListaNoticias(noticias: newsService.headlines),
    );
  }
}
