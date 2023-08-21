BEGIN { 
    FS = ""
    translation["G"] = "C"
    translation["C"] = "G"
    translation["T"] = "A"
    translation["A"] = "U"
}
{
    for (i = 1; i <= NF; i++) {
        if (! translation[$i]) {
            print "Invalid nucleotide detected."
            exit 1            
        }

        output = output translation[$i]
    }

    print output
}
