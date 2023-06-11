import 'package:arstate/arstate.dart';
import 'package:dio/dio.dart';

const int _defaultConnectTimeout = Duration.millisecondsPerMinute;
const int _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class XHttp {
  late final String baseUrl;

  late Dio _dio;
  late final List<Interceptor>? interceptors;

  XHttp({String? xBaseUrl, Interceptors? this.interceptors}) {
    // get api base url from .env file
    baseUrl = 'https://jantungku.dev-sistem.com/api';

    // set options
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: _defaultConnectTimeout,
      receiveTimeout: _defaultReceiveTimeout,
    ));

    // set request header
    _dio.options.headers['Accept'] = 'application/json';

    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }
  }

  Future<ApiResult<T>> get<T>(
    String endPoint, {
    bool authorization = false,
    dynamic Function(Response<dynamic>)? onSuccess,
    String? baseUrl,
  }) async {
    return sendRequest(
      () => _dio.get(endPoint),
      authorization: authorization,
      onSuccess: onSuccess,
      baseUrl: baseUrl,
    );
  }

  Future<ApiResult<T>> post<T>(
    String endPoint, {
    dynamic data,
    dynamic Function(Response<dynamic>)? onSuccess,
    String? baseUrl,
  }) async {
    return await sendRequest<T>(
      () async => _dio.post(
        endPoint,
        data: data,
      ),
      authorization: true,
      onSuccess: onSuccess,
      baseUrl: baseUrl,
    );
  }

  Future<ApiResult<T>> patch<T>(
    String endPoint, {
    dynamic data,
    dynamic Function(Response<dynamic>)? onSuccess,
    String? baseUrl,
  }) async {
    return await sendRequest<T>(
      () async => _dio.patch(
        endPoint,
        data: data,
      ),
      authorization: true,
      onSuccess: onSuccess,
      baseUrl: baseUrl,
    );
  }

  Future<ApiResult<T>> put<T>(
    String endPoint, {
    dynamic data,
    dynamic Function(Response<dynamic>)? onSuccess,
    String? baseUrl,
  }) async {
    return await sendRequest<T>(
      () async => _dio.put(
        endPoint,
        data: data,
      ),
      authorization: true,
      onSuccess: onSuccess,
      baseUrl: baseUrl,
    );
  }

  Future<ApiResult<T>> delete<T>(String endPoint) async {
    return await sendRequest<T>(
      () async => _dio.delete(
        endPoint,
      ),
      authorization: true,
    );
  }

  Future<ApiResult<T>> sendRequest<T>(
    Future<Response<dynamic>> Function() httpRequest, {
    bool authorization = false,
    String? baseUrl,
    dynamic Function(Response<dynamic>)? onSuccess,
  }) async {
    if (authorization) setAuthorization();

    if (baseUrl != null) {
      _dio.options.baseUrl = baseUrl;
    }

    try {
      Response<dynamic> response = await httpRequest();
      return ApiResult.success(
        data: onSuccess?.call(response) ?? 'Success',
      );
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  void setAuthorization() {
    // Auth auth = Auth.instance;
    // if (auth.isLoggedIn) {
    //   _dio.options.headers['Authorization'] = 'Bearer ${auth.token}';
    // }
  }
}
