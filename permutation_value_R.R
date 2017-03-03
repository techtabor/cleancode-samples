calculateValueOfPermutation <- function(permutation_string) {
    
      numbers <- parsePermutationInputToNumericVector(permutation_string)
      
      total_pairs <- numberOfTotalPairs(numbers)
      well_ordered_pairs <- numberOfWellOrderedPairs(numbers)
      
      return(well_ordered_pairs / total_pairs)
}


numberOfTotalPairs <- function(numbers) {
    num_array_length <- length(numbers)
    return(num_array_length * (num_array_length - 1) / 2)
}

numberOfWellOrderedPairs <- function(numbers) {
    if (length(numbers) == 1) {
        return(0)
    }
    
    pairs_w_first <- numberOfWellOrderedPairsWFirst(numbers)
    rest_numbers <- tail(numbers, length(numbers) - 1)
    
    return(pairs_w_first + numberOfWellOrderedPairs(rest_numbers))
}

numberOfWellOrderedPairsWFirst <- function(numbers) {
    sum(numbers > numbers[1])
}

parsePermutationInputToNumericVector <- function(permutation_string) {
    splitted_list <- stringr::str_split(permutation_string, ', ')
    numbers <- as.numeric(unlist(splitted_list)) 
    validateInput(numbers)
    return(numbers)
}

validateInput <- function(numbers) {
    if (!isInputPermutation(numbers)) {
        stop('input is not a valid permutation of numbers from 1 to n.')
    }
}

isInputPermutation <- function(numbers) {
    all(sort(numbers) ==  1:length(numbers))
}
