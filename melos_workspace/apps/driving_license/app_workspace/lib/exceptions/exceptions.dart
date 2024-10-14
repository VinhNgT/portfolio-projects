class LaunchUrlFailed implements Exception {
  const LaunchUrlFailed(this.url);
  final Uri url;

  @override
  String toString() => 'Could not launch $url';
}
