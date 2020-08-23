class ProRulesDTO {
  bool monitoring;
  bool checkinActivities;
  bool facialRecognition;
  bool refund;
  bool quiz;

  ProRulesDTO.map(Map<String, dynamic> json) {
    this.monitoring = json["monitoring"];
    this.checkinActivities = json["checkinActivities"];
    this.facialRecognition = json["facialRecognition"];
    this.refund = json["refund"];
    this.quiz = json["quiz"];
  }
}
