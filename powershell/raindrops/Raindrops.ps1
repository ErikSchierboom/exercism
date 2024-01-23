Function Get-Raindrops() {
    [CmdletBinding()]
    Param(
        [int]$Rain
    )

    $sounds = switch(0)
    {
        ($Rain % 3) {"Pling"}
        ($Rain % 5) {"Plang"}
        ($Rain % 7) {"Plong"}
        Default {$Rain}
    }
    -join $sounds
}