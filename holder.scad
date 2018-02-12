$fn = 200;

thick = 5;
rounded_corners = 7;
base_dim = [65,45];

uradius = 7.5;
uheight = 30;
uwidth = uradius*2+2*thick;
urounded_corners = 5;
offset_from_plate = 9;

module rounded_plate(t, x, y, r) {
    translate([r,r,0])
    hull() {
        cylinder(h=t, r=r);
        translate([x-2*r,0,0])
            cylinder(h=t, r=r);
        translate([x-2*r,y-2*r,0]) cylinder(h=t, r=r);
        translate([0,y-2*r,0]) cylinder(h=t, r=r);
    }
}

module base() {
    rounded_plate(thick, base_dim[0], base_dim[1], rounded_corners);
}

module uhold() {
    difference() {
        rounded_plate(thick,uheight,uwidth,urounded_corners);
        translate([uradius+thick,uwidth/2,-1]) cylinder(h=thick+2, r=uradius);
        translate([thick+uradius,thick,-1]) cube([uheight-thick-uradius+1,2*uradius,thick+2]);
    }
}

module connector() {
    translate([0,0,offset_from_plate]) cube([uwidth-2*urounded_corners,thick+uradius,thick]);
    cube([uwidth-2*urounded_corners,thick,offset_from_plate]);
}

translate([base_dim[0]/2-uwidth/2+2*urounded_corners/2,0/*base_dim[1]/2-thick-uradius*/,thick]) connector();

base();
translate([thick+uradius+base_dim[0]/2,base_dim[1]/2-thick-uradius+2,offset_from_plate+thick]) rotate([0,0,90]) uhold();