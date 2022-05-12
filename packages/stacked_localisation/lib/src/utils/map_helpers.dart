Map<String, String> flattenMap(Map<String, dynamic> map) {
  Map<String, String> flatMap = Map<String, String>();
  var parentKeys = map.keys;
  for (var parentKey in parentKeys) {
    var childMap = map[parentKey] as Map<String, dynamic>;
    var childKeys = childMap.keys;
    for (var childKey in childKeys) {
      var flatKey = '$parentKey.$childKey';
      flatMap[flatKey] = map[parentKey][childKey].toString();
    }
  }

  return flatMap;
}