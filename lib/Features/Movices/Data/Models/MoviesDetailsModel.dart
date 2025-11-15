class MovieDetaialsResponse {
  final String status;
  final String statusMessage;
  final MovieDetaialsResponseData data;
  final Meta meta;

  MovieDetaialsResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
    required this.meta,
  });

  factory MovieDetaialsResponse.fromJson(Map<String, dynamic> json) =>
      MovieDetaialsResponse(
        status: json['status'] as String? ?? '',
        statusMessage: json['status_message'] as String? ?? '',
        data: MovieDetaialsResponseData.fromJson(
          json['data'] as Map<String, dynamic>? ?? {},
        ),
        meta: Meta.fromJson(json['@meta'] as Map<String, dynamic>? ?? {}),
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'status_message': statusMessage,
    'data': data.toJson(),
    '@meta': meta.toJson(),
  };
}

class MovieDetaialsResponseData {
  final MovieDetials movie;

  MovieDetaialsResponseData({required this.movie});

  factory MovieDetaialsResponseData.fromJson(Map<String, dynamic> json) =>
      MovieDetaialsResponseData(
        movie: MovieDetials.fromJson(
          json['movie'] as Map<String, dynamic>? ?? {},
        ),
      );

  Map<String, dynamic> toJson() => {'movie': movie.toJson()};
}

class MovieDetials {
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
  final int likeCount;
  final String descriptionIntro;
  final String descriptionFull;
  final String ytTrailerCode;
  final String language;
  final String mpaRating;
  final String backgroundImage;
  final String backgroundImageOriginal;
  final String smallCoverImage;
  final String mediumCoverImage;
  final String largeCoverImage;
  final String mediumScreenshotImage1;
  final String mediumScreenshotImage2;
  final String mediumScreenshotImage3;
  final String largeScreenshotImage1;
  final String largeScreenshotImage2;
  final String largeScreenshotImage3;
  final List<Cast> cast;
  final List<TorrentMovieDetials> torrents;
  final String dateUploaded;
  final int dateUploadedUnix;

  MovieDetials({
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
    required this.likeCount,
    required this.descriptionIntro,
    required this.descriptionFull,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.mediumScreenshotImage1,
    required this.mediumScreenshotImage2,
    required this.mediumScreenshotImage3,
    required this.largeScreenshotImage1,
    required this.largeScreenshotImage2,
    required this.largeScreenshotImage3,
    required this.cast,
    required this.torrents,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory MovieDetials.fromJson(Map<String, dynamic> json) => MovieDetials(
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
    genres: (json['genres'] as List<dynamic>?)?.cast<String>() ?? [],
    likeCount: json['like_count'] as int? ?? 0,
    descriptionIntro: json['description_intro'] as String? ?? '',
    descriptionFull: json['description_full'] as String? ?? '',
    ytTrailerCode: json['yt_trailer_code'] as String? ?? '',
    language: json['language'] as String? ?? '',
    mpaRating: json['mpa_rating'] as String? ?? '',
    backgroundImage: json['background_image'] as String? ?? '',
    backgroundImageOriginal: json['background_image_original'] as String? ?? '',
    smallCoverImage: json['small_cover_image'] as String? ?? '',
    mediumCoverImage: json['medium_cover_image'] as String? ?? '',
    largeCoverImage: json['large_cover_image'] as String? ?? '',
    mediumScreenshotImage1: json['medium_screenshot_image1'] as String? ?? '',
    mediumScreenshotImage2: json['medium_screenshot_image2'] as String? ?? '',
    mediumScreenshotImage3: json['medium_screenshot_image3'] as String? ?? '',
    largeScreenshotImage1: json['large_screenshot_image1'] as String? ?? '',
    largeScreenshotImage2: json['large_screenshot_image2'] as String? ?? '',
    largeScreenshotImage3: json['large_screenshot_image3'] as String? ?? '',
    cast:
        (json['cast'] as List<dynamic>?)
            ?.map((e) => Cast.fromJson(e as Map<String, dynamic>? ?? {}))
            .toList() ??
        [],
    torrents:
        (json['torrents'] as List<dynamic>?)
            ?.map(
              (e) => TorrentMovieDetials.fromJson(
                e as Map<String, dynamic>? ?? {},
              ),
            )
            .toList() ??
        [],
    dateUploaded: json['date_uploaded'] as String? ?? '',
    dateUploadedUnix: json['date_uploaded_unix'] as int? ?? 0,
  );

  Map<String, dynamic> toJson() => {
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
    'like_count': likeCount,
    'description_intro': descriptionIntro,
    'description_full': descriptionFull,
    'yt_trailer_code': ytTrailerCode,
    'language': language,
    'mpa_rating': mpaRating,
    'background_image': backgroundImage,
    'background_image_original': backgroundImageOriginal,
    'small_cover_image': smallCoverImage,
    'medium_cover_image': mediumCoverImage,
    'large_cover_image': largeCoverImage,
    'medium_screenshot_image1': mediumScreenshotImage1,
    'medium_screenshot_image2': mediumScreenshotImage2,
    'medium_screenshot_image3': mediumScreenshotImage3,
    'large_screenshot_image1': largeScreenshotImage1,
    'large_screenshot_image2': largeScreenshotImage2,
    'large_screenshot_image3': largeScreenshotImage3,
    'cast': cast.map((e) => e.toJson()).toList(),
    'torrents': torrents.map((e) => e.toJson()).toList(),
    'date_uploaded': dateUploaded,
    'date_uploaded_unix': dateUploadedUnix,
  };
}

class Cast {
  final String name;
  final String characterName;
  final String urlSmallImage;
  final String imdbCode;

  Cast({
    required this.name,
    required this.characterName,
    required this.urlSmallImage,
    required this.imdbCode,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
    name: json['name'] as String? ?? '',
    characterName: json['character_name'] as String? ?? '',
    urlSmallImage: json['url_small_image'] as String? ?? '',
    imdbCode: json['imdb_code'] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'character_name': characterName,
    'url_small_image': urlSmallImage,
    'imdb_code': imdbCode,
  };
}

class TorrentMovieDetials {
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

  TorrentMovieDetials({
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

  factory TorrentMovieDetials.fromJson(Map<String, dynamic> json) =>
      TorrentMovieDetials(
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

  Map<String, dynamic> toJson() => {
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

class Meta {
  final int serverTime;
  final String serverTimezone;
  final int apiVersion;
  final String executionTime;

  Meta({
    required this.serverTime,
    required this.serverTimezone,
    required this.apiVersion,
    required this.executionTime,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    serverTime: json['server_time'] as int? ?? 0,
    serverTimezone: json['server_timezone'] as String? ?? '',
    apiVersion: json['api_version'] as int? ?? 0,
    executionTime: json['execution_time'] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    'server_time': serverTime,
    'server_timezone': serverTimezone,
    'api_version': apiVersion,
    'execution_time': executionTime,
  };
}
