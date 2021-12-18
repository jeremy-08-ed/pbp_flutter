abstract class EntityMapper<V> {
  V mapFromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson(V entity);
}
