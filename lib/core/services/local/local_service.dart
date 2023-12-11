abstract class LocalService<T> {
  void save(T save);
  Future<T?> getData();

  void delete();
}
