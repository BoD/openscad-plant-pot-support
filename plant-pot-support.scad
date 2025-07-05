module leave(x, y, rotate) {
  translate([x, y, 0])
    rotate([0, 0, rotate])
      linear_extrude(height = 4)
        resize([0, 18, 0], true)
          import("leave.svg", center = true);
}

module plant_pot_support(outer_diameter, width, thickness) {
  difference() {
    // Outer ring
    cylinder(h = thickness, r = outer_diameter / 2);

    // Inner ring
    cylinder(h = thickness, r = outer_diameter / 2 - width);
    
    leave_count = 13;
    leave_radius = outer_diameter / 2 - width / 2 - 2;
    for (i = [0 : leave_count - 1]) {
      angle = 360 / leave_count * i;
      leave(x = cos(angle) * leave_radius, y = sin(angle) * leave_radius, rotate = angle + 15);
    }
  };
}

module main() {
  outer_diameter = 150;
  thickness = 4;
  width = 30;

  plant_pot_support(
    outer_diameter = outer_diameter, 
    width = width,
    thickness = thickness,
  );
}

$fa = .1;
$fs = .1;
main();
