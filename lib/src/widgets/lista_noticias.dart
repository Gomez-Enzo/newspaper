import 'package:flutter/material.dart';
import 'package:newspaper/src/models/news_models.dart';
import 'package:newspaper/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {
  const ListaNoticias({
    Key? key,
    required this.noticias,
  }) : super(key: key);
  final List<Article> noticias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(noticia: noticias[index], index: index);
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  const _Noticia({
    required this.noticia,
    required this.index,
  });
  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(
          noticia: noticia,
          index: index,
        ),
        _TarjetaTitulo(
          noticia: noticia,
        ),
        _TarjetaImagen(
          noticia: noticia,
        ),
        _TarjetaBody(
          noticia: noticia,
        ),
        SizedBox(
          height: 10,
        ),
        Divider(),
      ],
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  const _TarjetaTopBar({
    required this.noticia,
    required this.index,
  });

  final Article noticia;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}. ',
            style: TextStyle(color: Colors.red),
          ),
          Text(
            '${noticia.source.name}. ',
          ),
        ],
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  const _TarjetaTitulo({required this.noticia});
  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  const _TarjetaImagen({required this.noticia});
  final Article noticia;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Container(
            child: (noticia.urlToImage != null)
                ? FadeInImage(
                    placeholder: AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage('${noticia.urlToImage}'))
                : Image(image: AssetImage('assets/img/no-image.png'))),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  const _TarjetaBody({required this.noticia});
  final Article noticia;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(noticia.description ?? ''),
    );
  }
}
