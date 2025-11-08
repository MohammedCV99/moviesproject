class AppNetwork {
  static String BaseURL = "https://route-movie-apis.vercel.app/";
  static String MoviesURL = "https://yts.mx/api/v2/";
  static String Authregister = "auth/register";
  static String Authlogin = "auth/Login";
  static String AuthResetPassword = "auth/reset-password";
  static String AddFav = "favorites/add";
  static String GetallFavMovies = "favorites/all";
  static String RemoveFav(int MovieID) {
    return "favorites/remove/${MovieID}";
  }

  static String IsFavMovie(int MovieID) {
    return "favorites/is-favorite/${MovieID}";
  }

  static String updateProfile = "profile";
  static String DeleteProfile = "profile";
  static String GetProfile = "profile";
  static String ListAllMovies(int pageID) {
    return "list_movies.json?limit=30&page=${pageID}";
  }

  static String MovieDetails(int movie_id) {
    return "https://yts.mx/api/v2/movie_details.json?movie_id=${movie_id}&with_images=true&with_cast=true";
  }

  static String MoviesByCategory(String genere) {
    return "https://yts.mx/api/v2/list_movies.json?genre=${genere}&order_by=desc&sort_by=year";
  }

  static String MovieSuggestions(int Movie_ID) {
    return "https://yts.mx/api/v2/movie_suggestions.json?movie_id=${Movie_ID}";
  }

  static String MovieSearch(String MovieName) {
    return "list_movies.json?query_term=${MovieName}";
  }
}
