BEGIN { 
    FS = ""
    translation["G"] = "C"
    translation["C"] = "G"
    translation["T"] = "A"
    translation["A"] = "U"
}
{
    for (i = 1; i <= NF; i++) {
        if (! ($i in translation)) {
            print "Invalid nucleotide detected."
            exit 1            
        } 
         
        output = output translation[$i]
    }

    print output
}
