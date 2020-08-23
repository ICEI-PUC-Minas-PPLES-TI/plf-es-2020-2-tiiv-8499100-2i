abstract class BaseDTO<T> {
  String mensagem;
  dynamic data;

  void fromJson(Map json);
  List<T> fromList(List<dynamic> list);
  Map toJson();
}
