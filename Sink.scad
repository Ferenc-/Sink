// BOSL2 from commit a6cdbe3db5d85bfa2f3549fd36b95371b0cc78ec
include <BOSL2/std.scad>
include <BOSL2/threading.scad>
    
union() {
// Top tray
up(42) back(3) /* Excenter */
 difference() {
 linear_extrude(8)
  glued_circles(r=30, spread=40, tangent=0);
 translate (v=[0, 0, 3.0])
  linear_extrude(5.5)
   glued_circles(r=28, spread=38, tangent=0);
 translate (v=[0, 0, -0.5]) // TODO needed?
  linear_extrude(4.5)
   glued_circles(r=18, spread=38, tangent=0);
 }

// V taper  cone
up(30) back(3) /* Excenter */ {
 rect_tube(
    size1=[70,40], size2=[80,40],
    isize1=[34,34], isize2=[65,35], 
    rounding=20, h=14
);
 // Cross
 up(7.5) {
  difference () {
  union() {
     cube([8,40,14], anchor=[0,0,0]);
     cylinder(h=14, d=16, anchor=[0,0,0]);
  }
  cylinder(h=16, d=8, anchor=[0,0,0]);
  }
 }
}

// Cone 1
up(27.5)
 tube(h=5, od1=27,5, od2=40, shift=[0, 3.0], wall=3);
 
// Shaft
tube(h=51, od=27.5, wall=2);
}
