typicalMountainValleyNumber <- function(max_value) {
    purrr::map_int(
        1:max_value,
        ~ mountainValleyNumber(.x)
    ) %>%
        mean()  
}

mountainValleyNumber <- function(n) {
    digits <- convertDecimalToBase(n, base = 3)
    mountainValleyNumberOfRepresentation(digits)
}

mountainValleyNumberOfRepresentation <- function(digits) {
    length(mountainDigitIndexes(digits)) - length(valleyDigitIndexes(digits))
}

mountainDigitIndexes <- function(digits) {
    purrr::keep(
        seq_along(digits),
        ~ isDigitMountain(digits, index = .x)
    )
}

valleyDigitIndexes <- function(digits) {
    purrr::keep(
        seq_along(digits),
        ~ isDigitValley(digits, index = .x)
    )
}

isDigitMountain <- function(digits, index) {
    neighbors <- getNeighbors(digits, index)
    digit <- digits[index]
    digit >= neighbors$left & digit >= neighbors$right
}

isDigitValley <- function(digits, index) {
    neighbors <- getNeighbors(digits, index)
    digit <- digits[index]
    is_valley_or_plane <- digit <= neighbors$left & digit <= neighbors$right
    !isDigitMountain(digits, index) & is_valley_or_plane
}

getNeighbors <- function(digits, index) {
    list(
        "left" = ifelse(index != 1, digits[index - 1], digits[index]),
        "right" = ifelse(index != length(digits), digits[index + 1], digits[index])
    )
}

convertDecimalToBase <- function(n, base = 2) {
    digits <- integer(0)
    while (n >= 1) {
        digits <- c(n %% base, digits)
        n <- floor(n / base)
    }
    digits
}
