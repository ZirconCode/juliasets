#include "golds.inc"
#include "metals.inc"
#include "finish.inc"      
#include "textures.inc"
          
          // thank you: http://paulbourke.net/fractals/quatjulia/
          
#declare VP = <-2,1.5,1.5>;
#declare VU = <0,1,0>;
#declare VD = vnormalize(<0,0,0> - VP);
#declare VR = vcross(VU,VD);
#declare ConstC = <-0.31,-0.2,-0.27,-0.37>; 
// sqr , quaternion :    
// <-0.01,-0.0,-0.57,-0.47>;                   likey
// <-0.0,0.1,-0.0,-0.8>;                            hmmm
                        // <-0.08,0.0,-0.8,-0.03>;    
//                       <-0.08,0.0,-0.83,-0.025>;
#declare SLICEDIST = clock; // 0.1   // clock

camera {
   location VP
   up y
   right x
   angle 60
   sky VU
   look_at VD
}

global_settings {
   ambient_light
   rgb <1,1,1>
}

background {
   color rgb <1,1,1>
}

light_source {
   VP + VU + 2*VR
   color rgb <1,1,1>
}
light_source {
   VP - VR
   color rgb <1,1,1>
}

julia_fractal {
   ConstC
   hypercomplex  //quaternion
   tan // sqr
   max_iteration 5      // 50
   precision 20   // 200
   slice <0,0,0,1> SLICEDIST      

//   texture { T_Brass_5C }              //{ T_Brass_5C }   
    
    texture { Y_Gradient}   //  good
       // texture{ Glass}        // that rendering time =(
      // texture{Tan_Wood}          
     // texture{Blue_Sky}
}
