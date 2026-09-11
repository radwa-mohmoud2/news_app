import 'package:flutter/material.dart';
import 'package:news_nti/model/news_model.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  final List<NewsModel> news = [
    NewsModel(
      image: 'asset/sports.png',
      source: 'BBC news',
      title: "Why are football’s biggest clubs starting a new tournament?",
      time: '3 hours ago',
    ),
    NewsModel(
      image: 'asset/sports.png',
      source: 'BBC news',
      title: "Why are football’s biggest clubs starting a new tournament?",
      time: '3 hours ago',
    ),
    NewsModel(
      image: 'asset/sports.png',
      source: 'BBC news',
      title: "Why are football’s biggest clubs starting a new tournament?",
      time: '5 hours ago',
    ),
    NewsModel(
      image: 'asset/sports.png',
      source: 'BBC news',
      title: "Why are football’s biggest clubs starting a new tournament?",
      time: '7 hours ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.white, size: 30),
        ),

        title: Text(
          'Sports',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white, size: 30),
          ),

          SizedBox(width: 5),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 55),

        child: ListView.separated(
          itemCount: news.length,

          itemBuilder: (context, index) {
            return NewsCard(news: news[index]);
          },

          separatorBuilder: (context, index) {
            return SizedBox(height: 25);
          },
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          news.image,
          width: double.infinity,
          height: 180,
          fit: BoxFit.cover,
        ),

        SizedBox(height: 7),
        Text(news.source, style: TextStyle(color: Colors.grey, fontSize: 9)),

        SizedBox(height: 3),

        Text(
          news.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: 5),

        Align(
          alignment: Alignment.centerRight,
          child: Text(
            news.time,
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ),
      ],
    );
  }
}
