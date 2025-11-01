class Movie {
  int id;
  String url;
  String imdbCode;
  String title;
  String titleEnglish;
  String titleLong;
  String slug;
  int year;
  double rating;
  int runtime;
  List<String> genres;
  String summary;
  String descriptionFull;
  String synopsis;
  String ytTrailerCode;
  String language;
  String mpaRating;
  String backgroundImage;
  String backgroundImageOriginal;
  String smallCoverImage;
  String mediumCoverImage;
  String largeCoverImage;
  String state;
  List<YtsTorrent> torrents;
  String dateUploaded;
  int dateUploadedUnix;

  Movie({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.summary,
    required this.descriptionFull,
    required this.synopsis,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.state,
    required this.torrents,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      url: json['url'],
      imdbCode: json['imdb_code'],
      title: json['title'],
      titleEnglish: json['title_english'],
      titleLong: json['title_long'],
      slug: json['slug'],
      year: json['year'],
      rating: (json['rating'] as num).toDouble(),
      runtime: json['runtime'],
      genres: List<String>.from(json['genres']),
      summary: json['summary'],
      descriptionFull: json['description_full'],
      synopsis: json['synopsis'],
      ytTrailerCode: json['yt_trailer_code'],
      language: json['language'],
      mpaRating: json['mpa_rating'],
      backgroundImage: json['background_image'],
      backgroundImageOriginal: json['background_image_original'],
      smallCoverImage: json['small_cover_image'],
      mediumCoverImage: json['medium_cover_image'],
      largeCoverImage: json['large_cover_image'],
      state: json['state'],
      torrents:
          (json['torrents'] as List)
              .map((torrent) => YtsTorrent.fromJson(torrent))
              .toList(),
      dateUploaded: json['date_uploaded'],
      dateUploadedUnix: json['date_uploaded_unix'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'imdb_code': imdbCode,
      'title': title,
      'title_english': titleEnglish,
      'title_long': titleLong,
      'slug': slug,
      'year': year,
      'rating': rating,
      'runtime': runtime,
      'genres': genres,
      'summary': summary,
      'description_full': descriptionFull,
      'synopsis': synopsis,
      'yt_trailer_code': ytTrailerCode,
      'language': language,
      'mpa_rating': mpaRating,
      'background_image': backgroundImage,
      'background_image_original': backgroundImageOriginal,
      'small_cover_image': smallCoverImage,
      'medium_cover_image': mediumCoverImage,
      'large_cover_image': largeCoverImage,
      'state': state,
      'torrents': torrents.map((torrent) => torrent.toJson()).toList(),
      'date_uploaded': dateUploaded,
      'date_uploaded_unix': dateUploadedUnix,
    };
  }
}

class YtsTorrent {
  String url;
  String hash;
  String quality;
  String type;
  String isRepack;
  String videoCodec;
  String bitDepth;
  String audioChannels;
  int seeds;
  int peers;
  String size;
  int sizeBytes;
  String dateUploaded;
  int dateUploadedUnix;

  YtsTorrent({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
    required this.isRepack,
    required this.videoCodec,
    required this.bitDepth,
    required this.audioChannels,
    required this.seeds,
    required this.peers,
    required this.size,
    required this.sizeBytes,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory YtsTorrent.fromJson(Map<String, dynamic> json) {
    return YtsTorrent(
      url: json['url'],
      hash: json['hash'],
      quality: json['quality'],
      type: json['type'],
      isRepack: json['is_repack'],
      videoCodec: json['video_codec'],
      bitDepth: json['bit_depth'],
      audioChannels: json['audio_channels'],
      seeds: json['seeds'],
      peers: json['peers'],
      size: json['size'],
      sizeBytes: json['size_bytes'],
      dateUploaded: json['date_uploaded'],
      dateUploadedUnix: json['date_uploaded_unix'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'hash': hash,
      'quality': quality,
      'type': type,
      'is_repack': isRepack,
      'video_codec': videoCodec,
      'bit_depth': bitDepth,
      'audio_channels': audioChannels,
      'seeds': seeds,
      'peers': peers,
      'size': size,
      'size_bytes': sizeBytes,
      'date_uploaded': dateUploaded,
      'date_uploaded_unix': dateUploadedUnix,
    };
  }
}
