String getIdByUrl({required String url}) {
  var index = 1;
  final splitUrl = url.split('/');
  if (splitUrl.last == '') {
    index++;
  }

  return splitUrl[splitUrl.length - index];
}
