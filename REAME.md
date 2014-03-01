This project was a way of learning the dart+angular by trying to 
apply it to a specific example.

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

