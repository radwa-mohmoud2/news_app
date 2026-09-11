import '../models/article_model.dart';

abstract class NewsRepo {
  Future<List<ArticleModel>> getNews(String categoryId);
}
