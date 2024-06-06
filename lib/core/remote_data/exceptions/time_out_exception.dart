class SimulationTimeOutException implements Exception {
  final String message;

  SimulationTimeOutException({this.message = 'Time Out!'});
}
