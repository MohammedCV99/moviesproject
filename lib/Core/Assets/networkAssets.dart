class AppNetwork {
  static String BaseURL = "https://route-movie-apis.vercel.app/";
  static String MoviesURL = "https://yts.lt/api/v2/";
  static String RemoveFav(int MovieID) {
    return "favorites/remove/${MovieID}";
  }

  static String login = "https://route-movie-apis.vercel.app/auth/Login";
  static String Signup = "https://route-movie-apis.vercel.app/auth/register";
  static String resetpassword =
      "https://route-movie-apis.vercel.app/auth/reset-password";
  static String IsFavMovie(int MovieID) {
    return "favorites/is-favorite/${MovieID}";
  }

  static String updateProfile = "https://route-movie-apis.vercel.app/profile";
  static String DeleteProfile = "https://route-movie-apis.vercel.app/profile";
  static String GetProfile = "https://route-movie-apis.vercel.app/profile";
  static String ListAllMovies(int pageID) {
    return "list_movies.json?limit=30&page=${pageID}";
  }

  static String ListNewMoviesByYear =
      "https://yts.lt/api/v2/list_movies.json?sort_by=year";
  static String MovieDetails(int movie_id) {
    return "https://yts.lt/api/v2/movie_details.json?movie_id=${movie_id}&with_images=true&with_cast=true";
  }

  static String MoviesByCategory(String genere) {
    return "https://yts.lt/api/v2/list_movies.json?genre=${genere}&order_by=desc&sort_by=year";
  }

  static String MovieSuggestions(int Movie_ID) {
    return "https://yts.lt/api/v2/movie_suggestions.json?movie_id=${Movie_ID}";
  }

  static String MovieSearch(String MovieName) {
    return "https://yts.lt/api/v2/list_movies.json?query_term=${MovieName}";
  }
}
