Map<int, String> CategoriesList = {
  1: "Action",
  2: "Adventure",
  3: "Animation",
  4: "Biography",
  5: "Comedy",
  6: "Crime",
  7: "Documentary",
  8: "Drama",
  9: "Family",
  10: "Fantasy",
  11: "Film-Noir",
  12: "Game-Show",
  13: "History",
  14: "Horror",
  15: "Music",
  16: "Musical",
  17: "Mystery",
  18: "News",
  19: "Reality-TV",
  20: "Romance",
  21: "Sci-Fi",
  22: "Sport",
  23: "Talk-Show",
  24: "Thriller",
  25: "War",
  26: "Western",
};

String? GetCategorieName(int id) {
  return CategoriesList[id];
}
