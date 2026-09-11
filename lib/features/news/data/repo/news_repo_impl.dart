import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_service.dart';
import '../models/article_model.dart';
import 'news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  final ApiService apiService;

  NewsRepoImpl(this.apiService);

  @override
  Future<List<ArticleModel>> getNews(String categoryId) async {
    final data = await apiService.get(
      endPoint: ApiConstants.topHeadlines,
      queryParameters: {'category': categoryId},
    );

    List<ArticleModel> articles = [];
    for (var item in data['articles']) {
      articles.add(ArticleModel.fromJson(item));
    }

    return articles;
  }
}
