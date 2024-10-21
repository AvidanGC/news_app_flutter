import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import '../repositories/news_repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository noticiasRepository;
  int currentPage = 1; 
  bool isLoadingMore = false;

  NewsBloc(this.noticiasRepository) : super(NewsLoading()) {
    on<FetchNews>(_onFetchNews);
    on<FetchMoreNews>(_onFetchMoreNews);
  }

   // GET FIRST NEWS
  Future<void> _onFetchNews(FetchNews event, Emitter<NewsState> emit) async {
    try {
      emit(NewsLoading());
      currentPage = 1;  // Reseteamos la página al iniciar
      final noticias = await noticiasRepository.getNews(page: currentPage);
      emit(NewsLoaded(noticias));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  // LOAD MORE NEWS
  Future<void> _onFetchMoreNews(FetchMoreNews event, Emitter<NewsState> emit) async {
     // Avoid multiple events if is loadign return
    if (isLoadingMore) return;
    
    try {
      if (state is NewsLoaded) {
        final currentState = state as NewsLoaded;
        isLoadingMore = true;
        currentPage++;
        final additionalNews = await noticiasRepository.getNews(page: currentPage);
        // current news with new ones
        emit(NewsLoaded(currentState.news + additionalNews));
      }
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
  
}
