import 'package:dio/dio.dart';


class AuthorizationInterceptor extends QueuedInterceptorsWrapper {
 // final TokenRepository _tokenRepository;

/*  AuthorizationInterceptor({
    required TokenRepository tokenRepository,
  }) : _tokenRepository = tokenRepository;*/

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
   /* final String? token = await _tokenRepository.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers.addAll(
        <String, String>{
          'Authorization': token,
        },
      );
    }
    handler.next(options);*/
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
     /* final refreshToken = await _tokenRepository.getRefreshToken();
      final accessToken = await _tokenRepository.getAccessToken();
      final projectId = await _tokenRepository.getProjectId();
      final deviceId = await _tokenRepository.getSessionId();
      RefreshTokenResponse refreshTokenResponse = await UserService().refresh(projectId, refreshToken, accessToken, deviceId);
      _tokenRepository.persistAccessToken(refreshTokenResponse.data!.accessToken, refreshToken);
      try {
        final RequestOptions requestOptions = err.response!.requestOptions;
        requestOptions.headers['Authorization'] = refreshTokenResponse.data!.accessToken;
        final options = Options(
          method: requestOptions.method,
          headers: requestOptions.headers,
        );
        final Dio dioRefresh = Dio(
          BaseOptions(
            baseUrl: requestOptions.baseUrl,
            headers: <String, String>{
              'accept': 'application/json',
            },
          ),
        );
        final response = await dioRefresh.request<dynamic>(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: options,
        );
        return handler.resolve(response);
      } on DioError {
        *//* if (err.response?.statusCode == 401) {
          SharedPreferences.getInstance().then((prefs) {
            prefs.clear();
            _tokenRepository.deleteAll();
            mainKey.currentState!.popAndPushNamed("/");

          });
        }*//*
      }*/
    }
    handler.next(err);
  }
}
