import 'package:game_center/domain/repositories/socket_mapping.dart';
import 'package:injectable/injectable.dart';

@injectable
class MarkPriceUseCase {
  final SocketMapping _socketMapping;

  MarkPriceUseCase(
    this._socketMapping,
  );

  Stream<double> updateMarkPrice() => _socketMapping.updateMarkPrice();
}
