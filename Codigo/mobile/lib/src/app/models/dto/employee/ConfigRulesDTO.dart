class ConfigRulesDTO {
  bool canDisablePunchReminder;
  bool canViewHoursBank;
  bool enabledMobileGeocoding;

  ConfigRulesDTO.map(Map<String, dynamic> json) {
    this.canDisablePunchReminder = json["canDisablePunchReminder"];
    this.canViewHoursBank = json["canViewHoursBank"];
    this.enabledMobileGeocoding = json["enabledMobileGeocoding"];
  }
}
