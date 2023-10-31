import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {

  RemoteArticlesBloc() : super(const RemoteArticlesLoading()) {
    on <GetArticles>(onGetArticles)
  }

  void getArticles(GetArticles event, Emitter<RemoteArticleState> emit) {
    final dataState = await _getArticleUsdeCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
          RemoteArticlesDone(dataState.data!)
      );
    }

    if (dataState is DataFailed)
      emit(
          RemoteArticlesError(dataState.error!)
      );
  }
}
