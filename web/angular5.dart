import 'package:angular/angular.dart';
import 'package:logging/logging.dart'; // logging example
import 'package:angular/routing/module.dart';

// Temporary, please follow https://github.com/angular/angular.dart/issues/476
@MirrorsUsed(override: '*')
import 'dart:mirrors';

@NgController(
    selector: '[angular5]',
    publishAs: 'ctrl')
    
class Angular5Controller {  
  Router router;
  String person; 
  List<Person> persons;
  Angular5Controller(this.router) {    // default values
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
  void addPerson(String newName, String newCity) {
    persons.add(new Person(newName, newCity));
    router.go('view1',{});
  }
}

class Person {
  String name;
  String city;
  Person(this.name, this.city);
}

angular5RouteInitializer(Router router, ViewFactory views) =>
    views.configure({
      'view1': ngRoute(
          path: '/view1',   // url path
          view: 'angular5_view1.html',  // url of template
          defaultRoute: true),  // this will be shown when starting
      'view2': ngRoute(
          path: '/view2',
          view: 'angular5_view2.html'),          
    });
    // see https://angulardart.org/tutorial/08-ch06-view.html
    // https://github.com/angular/route.dart


class MyAppModule extends Module {
  MyAppModule() {
    type(Angular5Controller);
    value(RouteInitializerFn, angular5RouteInitializer);
  }
}

void main() {
  // logging example
  Logger.root.level = Level.FINEST; // FINEST  FINE .. WARNING SEVERE SHOUT
  //Logger.root.onRecord.listen((LogRecord r) { print("${r.level} ${r.message}"); });
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  //Logger.root.warning("main()");  // better than print()
  
  
  ngBootstrap(module: new MyAppModule());
  Logger.root.info("main() bootstapped");  // better than print()
}
