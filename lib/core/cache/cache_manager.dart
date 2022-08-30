import 'package:hive_flutter/hive_flutter.dart';

abstract class ICacheManager<T> {
  T? getMovieHive(int key, Box box);
  void saveHive(T item, int id, Box box);
  void deleteHive(int key, Box box);
  void deleteAllHives(Box box);
  void saveUser(String user);
  void saveAll(List<T> entities, String boxName);
  void getAll(String boxName);
  bool isExist(int id, String boxName);
  String? getUser();
}

class CacheManager<T> implements ICacheManager<T> {
  @override
  T? getMovieHive(int key, Box box) {
    return box.get(key);
  }

  @override
  void saveHive(T item, int id, Box box) {
    box.put(id, item);
  }

  @override
  void deleteHive(int key, Box box) {
    box.delete(key);
  }

  @override
  void deleteAllHives(Box box) {
    box.deleteAll(box.keys);
  }

  @override
  void saveUser(String user) {
    Hive.box('user').put('user', user);
  }

  @override
  void saveAll(List<T> movies, String boxName) {
    final box = Hive.box(boxName);
    box.deleteAll(box.keys);
    for (var movie in movies) {
      box.put(movie.hashCode, movie);
    }
  }

  @override
  void getAll(String boxName) {
    final box = Hive.box(boxName);
    for (var entity in box.values) {
      print(entity);
    }
  }

  @override
  String? getUser() {
    return Hive.box('user').getAt(0);
  }

  @override
  bool isExist(int id, String boxName) {
    return Hive.box(boxName).containsKey(id);
  }
}
