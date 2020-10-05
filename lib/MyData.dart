class MyData{
  String name;
  String surname;

  MyData(this.name,this.surname);

  String getName(){
    return name;
}
String getSurname(){
    return surname;
}
  MyData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        surname = json['surname'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'email': surname,
      };
}