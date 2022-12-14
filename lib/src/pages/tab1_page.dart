import 'package:flutter/material.dart';
import 'package:newspaper/src/services/news_services.dart';
import 'package:newspaper/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return Scaffold(
      body: (newsService.headlines.isEmpty)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListaNoticias(noticias: newsService.headlines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
