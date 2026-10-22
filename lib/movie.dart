class Movie {
  final String title;
  final String genre;
  final int year;
  final double rating;
  final String image;

  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
  });
}

const List<Movie> movies = [
  Movie(title: 'Inception', genre: 'Sci-Fi', year: 2010, rating: 8.8, image: 'assets/posters/inception.png'),
  Movie(title: 'The Dark Knight', genre: 'Action', year: 2008, rating: 9.0, image: 'assets/posters/dark_knight.png'),
  Movie(title: 'Interstellar', genre: 'Sci-Fi', year: 2014, rating: 8.7, image: 'assets/posters/interstellar.png'),
  Movie(title: 'Gladiator', genre: 'Action', year: 2000, rating: 8.5, image: 'assets/posters/gladiator.png'),
  Movie(title: 'Toy Story', genre: 'Animation', year: 1995, rating: 8.3, image: 'assets/posters/toy_story.png'),
  Movie(title: 'The Godfather', genre: 'Crime', year: 1972, rating: 9.2, image: 'assets/posters/godfather.png'),
  Movie(title: 'Parasite', genre: 'Thriller', year: 2019, rating: 8.5, image: 'assets/posters/parasite.png'),
  Movie(title: 'Coco', genre: 'Animation', year: 2017, rating: 8.4, image: 'assets/posters/coco.png'),
  Movie(title: 'Whiplash', genre: 'Drama', year: 2014, rating: 8.5, image: 'assets/posters/whiplash.png'),
  Movie(title: 'Mad Max: Fury Road', genre: 'Action', year: 2015, rating: 8.1, image: 'assets/posters/mad_max.png'),
];
