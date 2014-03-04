import 'package:angular/angular.dart';

// Temporary, please follow https://github.com/angular/angular.dart/issues/476
@MirrorsUsed(override: '*')
import 'dart:mirrors';

@NgController(
    selector: '[angular4]',
    publishAs: 'ctrl')
    
class Angular4Controller {  
  String person; 
  List<Person> persons;
  Angular4Controller() {    // default values
    persons = _loadData();
  }  
  
  List<Person> _loadData() {
    return [
      new Person('Dave ','Dublin'),
      new Person('Bob ','Dublin'),
      new Person('Julie ','Vevey'),       
    ];
  }  
  
  Person selectedPerson;
  void selectPerson(Person person) {
    selectedPerson = person;
  }  
}

class Person {
  String name;
  String city;
  Person(this.name, this.city);
}

void main() {
  ngBootstrap(module: new Module()..type(Angular4Controller));
  print("main()");
}