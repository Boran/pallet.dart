import 'dart:html';
import 'dart:math';
import 'package:angular/angular.dart';

// Temporary, please follow https://github.com/angular/angular.dart/issues/476
@MirrorsUsed(override: '*')
import 'dart:mirrors';

ButtonElement calcButton;

//-------
@NgController(
    selector: '[pallet]',
    publishAs: 'ctrl')
    
class PalletController {
  // inputs
  String rollwidth_mm, diam_mm, rows, pwidth_mm, plength_mm;
  String maxLoadingHeight, maxLoadingWeight, rollkgs;  
  String layout, threed; 
  List layouts=['Vertical interleaved','Vertical square',
                        'Horizontal interleaved','Horizontal square'];
  // TODO: get index of selected value
  List threeds=['Yes','No'];
  
  // settings
  int pwidth=360;  // need better reel icon before using bigger sizes
  int plength=300; // down
  
  //outputs
  var rollsperpallet=0, palletheight=0, f='output.jpg';
  var p2, p1, pscaley, pscalex;   
 
  PalletController() {   // default form values
    layout = layouts[0]; 
    threed = threeds[0];
    rollwidth_mm='300';
    diam_mm='300';
    rows='1';
    plength_mm='1000';
    pwidth_mm='1200';
    maxLoadingHeight='1500';
    maxLoadingWeight='800';
    rollkgs='0';
  }
  
  calculate() {
    int diam, rollwidth, radius, radius_mm, CompressedDiameter, CompressedDiameter_mm;
    
    p1=plength_mm;  // used?
    p2=pwidth_mm;
    pscaley=int.parse(pwidth_mm)/pwidth;    // ratio of pixes to mm
    pscalex=int.parse(plength_mm)/plength;  // ratio of pixes to mm    
    print("calculate() rollwidth=" +rollwidth_mm +', diam=' +diam_mm
        +"rows=$rows mm/pixel: pscalex=" +pscalex.toString()
        +', pscaley=' +pscaley.toString()
        +", pallet mm: $pwidth_mm x $plength_mm"
       );
    
    if (layout=='versq' || layout=='verint') {  // vertical
      diam=(int.parse(diam_mm)/pscalex).round(); // keep as ints
      rollwidth=(int.parse(rollwidth_mm)/pscaley).round();
    } else {
      // horizontal: scaling is opposite
      diam=(int.parse(diam_mm)/pscaley).round();
      rollwidth=(int.parse(rollwidth_mm)/pscalex).round();
    }
    radius=(diam/2).round();
    radius_mm=(int.parse(diam_mm)/2).round();
    CompressedDiameter=(sqrt(3*radius*radius)).round();
    CompressedDiameter_mm=(sqrt(3*radius_mm*radius_mm)).round();
    print("calculate() $layout: px rollwidth=$rollwidth diam=$diam radius=$radius"
        +" CompressedDiameter=$CompressedDiameter pallet:$pwidth X $plength");
    
    //todo: send parameters to a backend, which will give back an image
    print('todo: send parameters to a backend, which will give back an image');
    
  }
}


void main() {
/*  querySelector("#sample_text_id")
    ..text = "Click me!"
    ..onClick.listen(reverseText);
  
  calcButton = querySelector('#calcButton');
  calcButton.onClick.listen(doCalc); */

  ngBootstrap(module: new Module()..type(PalletController));
}
