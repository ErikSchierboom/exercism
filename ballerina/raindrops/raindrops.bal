public function convert(int n) returns string {
    string drops = "";

    if n % 3 == 0 { 
        drops += "Pling";
    }
    if n % 5 == 0 {
        drops += "Plang";
    }
    if n % 7 == 0 {
        drops += "Plong";
    }

    return drops.length() > 0 ? drops : n.toString();
}
