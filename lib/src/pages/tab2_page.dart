import 'package:flutter/material.dart';
import 'package:newspaper/src/models/category_model.dart';
import 'package:newspaper/src/services/news_services.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(child: _ListaCategorias()),
        ],
      )),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        final cName = categories[index].name;
        return Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              _CategoryButton(
                categoria: categories[index],
              ),
              SizedBox(
                height: 5,
              ),
              Text('${cName[0].toUpperCase()}${cName.substring(1)}')
            ],
          ),
        );
      },
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    required this.categoria,
  });
  final Category categoria;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categoria.name;
        //print('${categoria.name}');
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          categoria.icon,
          color: Colors.black54,
        ),
      ),
    );
  }
}
