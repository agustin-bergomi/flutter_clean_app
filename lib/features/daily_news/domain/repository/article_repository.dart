import 'package:news_app_clean_architecture/features/daily_news/domain/entities/ArticleEntity.dart';

import '../../../../core/resources/data_state.dart';

abstract class ArticleRepository {

  Future<DataState<List<ArticleEntity>>> getNewsArticles();

}
