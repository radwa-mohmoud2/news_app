import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/news_repo.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepo newsRepo;

  NewsCubit(this.newsRepo) : super(NewsInitial());

  Future<void> getNews(String categoryId) async {
    emit(NewsLoading());
    try {
      final articles = await newsRepo.getNews(categoryId);
      emit(NewsSuccess(articles));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
