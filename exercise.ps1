function Exercise
{
    $exercise = Split-Path $PWD -Leaf
    $track = Split-Path $PWD -Parent | Split-Path -Leaf

    git ls-files --error-unmatch README.md 2>$null
    $type = If ($?) {"iteration"} Else {"solution"}

    exercism submit
    git add .
    git commit -m "${track}/${exercise}: add ${type}"
    git push
}


