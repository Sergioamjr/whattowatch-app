class AppConfig {
  final appName = 'WhatToWatch';
  final imagePrefix = 'https://image.tmdb.org/t/p/w500';

  String get name {
    return this.appName;
  }

  String get image {
    return this.imagePrefix;
  }
}
