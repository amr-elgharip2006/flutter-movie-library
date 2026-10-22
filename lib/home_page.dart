import 'package:flutter/material.dart';

import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGrid = false;
  String query = '';
  // BONUS: one shared value for all cards, stored in the parent.
  int discount = 20;

  void _decreaseDiscount() {
    setState(() {
      discount = discount > 0 ? discount - 1 : 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    final q = query.toLowerCase();
    final List<Movie> filtered = movies
        .where((m) => m.title.toLowerCase().contains(q) || m.genre.toLowerCase().contains(q))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Library'),
        actions: [
          IconButton(
            tooltip: isGrid ? 'List view' : 'Grid view',
            icon: Icon(isGrid ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('No movies found', style: TextStyle(fontSize: 18)))
                : isGrid
                    ? GridView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: filtered.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.62,
                        ),
                        itemBuilder: (context, index) {
                          return MovieCard(
                            movie: filtered[index],
                            discount: discount,
                            onDiscountTap: _decreaseDiscount,
                          );
                        },
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: SizedBox(
                              height: 320,
                              child: MovieCard(
                                movie: filtered[index],
                                discount: discount,
                                onDiscountTap: _decreaseDiscount,
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
