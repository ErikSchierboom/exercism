package lasagna

// PreparationTime takes layers and the average time and returns the preparation time.
func PreparationTime(layers []string, averageTimePerLayer int) int {
	if averageTimePerLayer == 0 {
		averageTimePerLayer = 2
	}

	return len(layers) * averageTimePerLayer
}

// Quantities takes layers and returns the amount of noodles and sauce required.
func Quantities(layers []string) (noodles int, sauce float64) {
	for _, layer := range layers {
		if layer == "noodles" {
			noodles += 50
		} else if layer == "sauce" {
			sauce += 0.2
		}
	}

	return
}

// AddSecretIngredient adds the secret ingredient to my list.
func AddSecretIngredient(friendsList []string, myList []string) {
	myList[len(myList)-1] = friendsList[len(friendsList)-1]
}

// ScaleRecipe scales the recipe.
func ScaleRecipe(amounts []float64, scale int) []float64 {
	var scaled = make([]float64, len(amounts))

	for i, amount := range amounts {
		scaled[i] = amount * float64(scale) / 2
	}

	return scaled
}
