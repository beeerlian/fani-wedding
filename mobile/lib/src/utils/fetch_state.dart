import 'package:equatable/equatable.dart';

enum FetchingStatus { initial, loading, success, failed }

class FetchState<T> extends Equatable {
  const FetchState(
      {this.status = FetchingStatus.initial, this.error = "", this.data});

  final FetchingStatus status;
  final String error;
  final T? data;

  FetchState<T> reset() =>
      FetchState<T>(status: FetchingStatus.initial, error: "", data: null);

  FetchState<T> copyWith({
    FetchingStatus? status,
    String? error,
    T? data,
  }) =>
      FetchState<T>(
          status: status ?? this.status,
          error: error ?? this.error,
          data: data ?? this.data);

  @override
  List<dynamic> get props => [status, error, data];
}
