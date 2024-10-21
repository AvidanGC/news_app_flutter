import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/news_bloc.dart';
import '../blocs/news_event.dart';
import '../blocs/news_state.dart';
import '../widgets/news_item.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // start news load 
    BlocProvider.of<NewsBloc>(context).add(FetchNews());
    // load more news (pagination)
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        final newsBloc = BlocProvider.of<NewsBloc>(context);
        if (!newsBloc.isLoadingMore) {
          newsBloc.add(FetchMoreNews());
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            return ListView.builder(
              controller: _scrollController, 
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                final news = state.news[index];
                return NewsItem(
                  title: news.title,
                  description: news.description,
                  imagenUrl: news.urlImagen,
                  onTap: () {
                    //Go page News Detail 
                    Navigator.pushNamed( context, '/detail', arguments: news);
                  },
                );
              },
            );
          } else if (state is NewsError) {
            return Center(child: Text('Error: ${state.msg}'));
          }
          return const Center(child: Text('No hay noticias disponibles.'));
        },
      ),
    );
  }
}
