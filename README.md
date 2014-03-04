This project was a way of learning the dart+angular by trying to 
apply it to a specific examples.

A) angular4.html
===============
With angular4.dart this imitates the AngularJS example number 4.


B) Pallet tool
==============
A tool for laying out (polythene) reel on a pallet, with different scenarios has already been written in PHP, the most recent being with Symfony2 framework.
https://github.com/Boran/pallet


Current status:
- Weform created with inputs all data, tie in angular
- Sub calls a calculate() that does some initial work.
  There I learned how different types worked, are converted and using the math lib.

Next step would be to call a server side program that calls Imagick() via an APi to build the pallet images and all löines, shapes etc withing that image.
I dont see a Dart API on http://www.imagemagick.org/.
So it would have to be created.
So this is not ideal for a Dart learning project.
>> stopped for now. 

------------------
To run this
a) with the Dart editor
- first install the Dart Editor (+ chrome browser), then  right click on the index.html and 'Run in Dartrium'.
b) Standalone in another moderm browser
- Change index.html to point from 
  <script type="application/dart" src="dart1.dart"></script>
  to the javascript compiled from the dart editor:
  <script src="dart1.dart.js"></script>
- Then open index.html in the browser
-----------------------  