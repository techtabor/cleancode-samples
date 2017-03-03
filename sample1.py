def inputNumbers():
    numberListString = raw_input("Please input your numbers, separated by commas (and spaces): ")
    numberListStringComponents = numberListString.split(",")
    numberList = map(int, numberListStringComponents)
    return numberList

def computeNumberOfPairs(numberList):
    numberOfElements = len(numberList)
    return numberOfElements * (numberOfElements - 1) / 2

def mapIncreasingPairTo1(numberTuple):
    if numberTuple[0] < numberTuple[1]:
        return 1
    return 0

def generatePairList(numberList):
    pairs = []
    numberOfElements = len(numberList)
    for indexLeft in range(0, numberOfElements):
        for indexRight in range(indexLeft + 1, numberOfElements):
            numberLeft = numberList[indexLeft]
            numberRight = numberList[indexRight]
            pairs.append((numberLeft, numberRight))
    return pairs

def computeNumberOfIncreasingPairs(numberList):
    pairs = generatePairList(numberList)
    counts = map(mapIncreasingPairTo1, pairs)
    numberOfIncreasingPairs = sum(counts)
    return numberOfIncreasingPairs

def computeIncreasingPairRatio(numberList):
    numberOfIncreasingPairs = computeNumberOfIncreasingPairs(numberList)
    numberOfAllPairs = computeNumberOfPairs(numberList)
    increasingPairRatio = float(numberOfIncreasingPairs) / float(numberOfAllPairs)
    return increasingPairRatio

numberList = inputNumbers()
increasingPairRatio = computeIncreasingPairRatio(numberList)
print(str(increasingPairRatio))
