import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_nti/core/network/api_service.dart';
import 'package:news_nti/core/widgets/error_widget.dart';
import 'package:news_nti/core/widgets/loading_widget.dart';
import 'package:news_nti/features/news/data/models/article_model.dart';
import 'package:news_nti/features/news/data/repo/news_repo_impl.dart';
import 'package:news_nti/features/news/presentation/view_model/news_cubit.dart';
import 'package:news_nti/features/news/presentation/view_model/news_state.dart';

class NewsView extends StatelessWidget {
  final String categoryId;

  const NewsView({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryId.toUpperCase()),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 28),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const LoadingWidget();
          } else if (state is NewsError) {
            return CustomErrorWidget(
              errorMessage: state.message,
              onRetry: () {
                context.read<NewsCubit>().getNews(categoryId);
              },
            );
          } else if (state is NewsSuccess) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.articles.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return NewsCard(article: state.articles[index]);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final ArticleModel article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            article.urlToImage ?? '',
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 180,
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image, size: 50),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Text(
          article.sourceName ?? 'Unknown Source',
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        ),
        const SizedBox(height: 4),
        Text(
          article.title ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            article.publishedAt?.split('T').first ?? '',
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ),
      ],
    );
  }
}
