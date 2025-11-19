class Moviesmodel {
  final String status;
  final String statusMessage;
  final YtsData data;
  final YtsMeta meta;

  Moviesmodel({
    required this.status,
    required this.statusMessage,
    required this.data,
    required this.meta,
  });

  factory Moviesmodel.fromJson(Map<String, dynamic> json) {
    return Moviesmodel(
      status: json['status'] as String? ?? '',
      statusMessage: json['status_message'] as String? ?? '',
      data: YtsData.fromJson(json['data'] as Map<String, dynamic>? ?? {}),
      meta: YtsMeta.fromJson(json['@meta'] as Map<String, dynamic>? ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status_message': statusMessage,
      'data': data.toJson(),
      '@meta': meta.toJson(),
    };
  }
}

class YtsData {
  final int movieCount;
  final int limit;
  final int pageNumber;
  final List<Movie> movies;

  YtsData({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movies,
  });

  factory YtsData.fromJson(Map<String, dynamic> json) {
    return YtsData(
      movieCount: json['movie_count'] as int? ?? 0,
      limit: json['limit'] as int? ?? 0,
      pageNumber: json['page_number'] as int? ?? 0,
      movies:
          (json['movies'] as List? ?? [])
              .map(
                (movie) => Movie.fromJson(movie as Map<String, dynamic>? ?? {}),
              )
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movie_count': movieCount,
      'limit': limit,
      'page_number': pageNumber,
      'movies': movies.map((movie) => movie.toJson()).toList(),
    };
  }
}

class Movie {
  final int id;
  final String url;
  final String imdbCode;
  final String title;
  final String titleEnglish;
  final String titleLong;
  final String slug;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  final String summary;
  final String descriptionFull;
  final String synopsis;
  final String ytTrailerCode;
  final String language;
  final String mpaRating;
  final String backgroundImage;
  final String backgroundImageOriginal;
  final String smallCoverImage;
  final String mediumCoverImage;
  final String largeCoverImage;
  final String state;
  final List<Torrent> torrents;
  final String dateUploaded;
  final int dateUploadedUnix;

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
      id: json['id'] as int? ?? 0,
      url: json['url'] as String? ?? '',
      imdbCode: json['imdb_code'] as String? ?? '',
      title: json['title'] as String? ?? '',
      titleEnglish: json['title_english'] as String? ?? '',
      titleLong: json['title_long'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      year: json['year'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      runtime: json['runtime'] as int? ?? 0,
      genres: (json['genres'] as List? ?? []).cast<String>(),
      summary: json['summary'] as String? ?? '',
      descriptionFull: json['description_full'] as String? ?? '',
      synopsis: json['synopsis'] as String? ?? '',
      ytTrailerCode: json['yt_trailer_code'] as String? ?? '',
      language: json['language'] as String? ?? '',
      mpaRating: json['mpa_rating'] as String? ?? '',
      backgroundImage: json['background_image'] as String? ?? '',
      backgroundImageOriginal:
          json['background_image_original'] as String? ?? '',
      smallCoverImage: json['small_cover_image'] as String? ?? '',
      mediumCoverImage: json['medium_cover_image'] as String? ?? '',
      largeCoverImage: json['large_cover_image'] as String? ?? '',
      state: json['state'] as String? ?? '',
      torrents:
          (json['torrents'] as List? ?? [])
              .map(
                (torrent) =>
                    Torrent.fromJson(torrent as Map<String, dynamic>? ?? {}),
              )
              .toList(),
      dateUploaded: json['date_uploaded'] as String? ?? '',
      dateUploadedUnix: json['date_uploaded_unix'] as int? ?? 0,
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

class Torrent {
  final String url;
  final String hash;
  final String quality;
  final String type;
  final String isRepack;
  final String videoCodec;
  final String bitDepth;
  final String audioChannels;
  final int seeds;
  final int peers;
  final String size;
  final int sizeBytes;
  final String dateUploaded;
  final int dateUploadedUnix;

  Torrent({
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

  factory Torrent.fromJson(Map<String, dynamic> json) {
    return Torrent(
      url: json['url'] as String? ?? '',
      hash: json['hash'] as String? ?? '',
      quality: json['quality'] as String? ?? '',
      type: json['type'] as String? ?? '',
      isRepack: json['is_repack'] as String? ?? '',
      videoCodec: json['video_codec'] as String? ?? '',
      bitDepth: json['bit_depth'] as String? ?? '',
      audioChannels: json['audio_channels'] as String? ?? '',
      seeds: json['seeds'] as int? ?? 0,
      peers: json['peers'] as int? ?? 0,
      size: json['size'] as String? ?? '',
      sizeBytes: json['size_bytes'] as int? ?? 0,
      dateUploaded: json['date_uploaded'] as String? ?? '',
      dateUploadedUnix: json['date_uploaded_unix'] as int? ?? 0,
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

class YtsMeta {
  final int serverTime;
  final String serverTimezone;
  final int apiVersion;
  final String executionTime;

  YtsMeta({
    required this.serverTime,
    required this.serverTimezone,
    required this.apiVersion,
    required this.executionTime,
  });

  factory YtsMeta.fromJson(Map<String, dynamic> json) {
    return YtsMeta(
      serverTime: json['server_time'] as int? ?? 0,
      serverTimezone: json['server_timezone'] as String? ?? '',
      apiVersion: json['api_version'] as int? ?? 0,
      executionTime: json['execution_time'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'server_time': serverTime,
      'server_timezone': serverTimezone,
      'api_version': apiVersion,
      'execution_time': executionTime,
    };
  }
}
