class EmployerDTO {
  num id;
  String companyName;
  String code;

  EmployerDTO.map(Map<String, dynamic> json) {
    this.id = json["id"];
    this.companyName = json["companyName"];
    this.code = json["code"];
  }
}
