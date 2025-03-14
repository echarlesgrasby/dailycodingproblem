$list_of_numbers = New-Object System.Collections.ArrayList;
$list_of_numbers.Add(10) | Out-Null
$list_of_numbers.Add(15) | Out-Null
$list_of_numbers.Add(20) | Out-Null
$list_of_numbers.Add(-3) | Out-Null

$target_number = 17

$new_list = New-Object System.Collections.ArrayList;

function determine_objective(){
    
    #Have we determined that a match exists?
    $found_flag = $false

    #Short circuit a return for the empty set
    if($list_of_numbers.Count -eq 0){
        return $false
    }

    #iterate over the set- find the 2nd part of the pair
    foreach($i in $list_of_numbers){
        $new_list.Add(($target_number - $i)) | Out-Null
    }

    #find the 1st part of the pair
    foreach($i in $new_list){
        $other_item = $target_number - $i
        if($other_item -in $list_of_numbers -and ($i -in $list_of_numbers)){
            $found_flag = $true
        }
    }

    #return the found flag
    return $found_flag
}

$match_exists = determine_objective;
"$match_exists"