package gross

// Units stores the Gross Store unit measurements.
func Units() map[string]int {
	return map[string]int{
		"quarter_of_a_dozen": 3,
		"half_of_a_dozen":    6,
		"dozen":              12,
		"small_gross":        120,
		"gross":              144,
		"great_gross":        1728,
	}
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	return make(map[string]int)
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	unitQuantity, unitExists := units[unit]
	if !unitExists {
		return false
	}

	bill[item] = unitQuantity + bill[item]
	return true
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
	unitQuantity, unitExists := units[unit]
	if !unitExists {
		return false
	}

	itemQuantity, itemExists := bill[item]
	if !itemExists {
		return false
	}

	newQuantity := itemQuantity - unitQuantity

	switch {
	case newQuantity < 0:
		return false
	case newQuantity == 0:
		delete(bill, item)
		return true
	default:
		bill[item] = itemQuantity - unitQuantity
		return true
	}
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
	quantity, exists := bill[item]
	return quantity, exists
}
