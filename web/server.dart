import 'dart:async';

main() {
  new Timer(new Duration(seconds:5), () => print('timer after 5 sec'));
  print('end of main');
}