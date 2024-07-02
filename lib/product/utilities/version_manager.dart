//version control
class VersionManager {
  VersionManager({
    required this.deviceValue,
    required this.databaseValue,
  });

  final String deviceValue;
  final String? databaseValue;

  bool isNeedUpdate() {
    //incoming data with '.'
    //convert to int
    if (databaseValue != null) {
      final deviceNumberSplit = deviceValue.split('.').join();
      final databaseNumberSplit = databaseValue!.split('.').join();

      final deviceNumber = int.tryParse(deviceNumberSplit);
      final databaseNumber = int.tryParse(databaseNumberSplit);

      if (deviceNumber == null || databaseNumber == null) {
        return false;
      }

      //to compare
      return deviceNumber == databaseNumber;
    } else {
      return false;
    }
  }
}
