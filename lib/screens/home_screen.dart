import 'package:flutter/material.dart';
import 'package:news_nti/model/item_model.dart';
import 'package:news_nti/screens/news_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemModel> items = [
      ItemModel(title: 'Sports', image: 'asset/sports.png', color: Colors.red),
      ItemModel(
        title: 'Politics',
        image: 'asset/Politics.png',
        color: Colors.deepPurpleAccent,
      ),
      ItemModel(title: 'Health', image: 'asset/health.png', color: Colors.pink),

      ItemModel(
        title: 'Business',
        image: 'asset/bussines.png',
        color: Colors.brown,
      ),
      ItemModel(
        title: 'Environment',
        image: 'asset/environment.png',
        color: Colors.green,
      ),
      ItemModel(
        title: 'Science',
        image: 'asset/science.png',
        color: Colors.yellow,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('News', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Pick your category of interest',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 24),

              GridView.builder(
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewsScreen()),
                      );
                    },
                    child: CustomContainer(
                      color: items[index].color,
                      item: items[index],
                      index: index,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.color,
    required this.index,
    required this.item,
  });
  final Color color;
  final ItemModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(index.isEven ? 0 : 24),
          bottomLeft: Radius.circular(index.isEven ? 24 : 0),
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(item.image),
          Text(
            item.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
