
phone = [158.8,75.7,7.6];
holder = [133,70,1];
angle = 20;
wall = 3;
block = 20;

difference() {
    rotate([-angle,0,0])
    translate([0,-phone[1]-wall,-(wall+phone[2]+block)]) union() {
        cube(phone+[2*wall,wall,wall+block]);
        translate([0,0,-wall-phone[2]-1]) difference() {
            cube(phone+[2*wall,wall,wall+1]);
            translate([wall,-0.1,1]) cube(phone+[0,0.2,1.2]);
            translate([wall+1,-0.1,-0.1]) cube(phone+[-2,0.2,1.2]);
        }
    }
    translate([-0.1,-200,-0.1]) cube([200,200.1,200]);
}

translate([0,-holder[1]-3.3*wall,10]) difference() {
    cube(holder+[0,2*wall,2*wall]);
    translate([-0.1,wall-0.1,wall]) cube(holder+[0.1,0.2,0.2]);
}

translate([0,-holder[1]-3.3*wall,20]) difference() {
    cube(holder+[0,2*wall,2]);
}