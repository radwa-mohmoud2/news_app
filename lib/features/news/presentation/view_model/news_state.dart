import '../../data/models/article_model.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final List<ArticleModel> articles;

  NewsSuccess(this.articles);
}

final class NewsError extends NewsState {
  final String message;

  NewsError(this.message);
}
