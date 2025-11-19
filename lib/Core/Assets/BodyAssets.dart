class AppNetworkBody {
  static Map<String, dynamic> AuthLogin(String email, String password) {
    return {"email": email, "password": password};
  }

  static Map<String, dynamic> AuthRegister(
    String name,
    String email,
    String password,
    String confirmPassword,
    String Phone,
    int avaterId,
  ) {
    return {
      "name": name,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "Phone": Phone,
      "avaterId": avaterId,
    };
  }

  static Map<String, dynamic> ResetPassword(
    String oldPassword,
    String newPassword,
  ) {
    return {"oldPassword": oldPassword, "newPassword": newPassword};
  }

  static Map<String, dynamic> addMovietoFav(
    String movieId,
    String name,
    double rating,
    String imageURL,
    String year,
  ) {
    return {
      "movieId": movieId,
      "name": name,
      "rating": rating,
      "imageURL": imageURL,
      "year": year,
    };
  }

  static Map<String, dynamic> updateProfile(String email, int avaterId) {
    return {"email": email, "avaterId": avaterId};
  }
}
