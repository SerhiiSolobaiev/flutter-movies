import 'package:dio/dio.dart';

class BearerInterceptor extends Interceptor {
  // should be hidden:
  final _apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMWY0ZDg2MzY0ZjY2YWI0OGJkNjJmMGMzYmM4YmJjOSIsIm5iZiI6MTc0MjM4OTY4OS41NzQwMDAxLCJzdWIiOiI2N2RhYzFiOTdiYTdkYTcxNjNhMWVjMWQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.w8AObWJ7pJ9yxTupyNJxNYOcSKocHXI4NvFcsz0mx8M';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Authorization': 'Bearer $_apiKey',
      'Content-Type': 'application/json'
    });
    handler.next(options);
  }
}
