#include "vehicle_purchase.h"

namespace vehicle_purchase
{

    // needs_license determines whether a license is needed to drive a type of vehicle. Only "car" and "truck" require a license.
    bool needs_license(std::string kind)
    {
        return kind == "car" || kind == "truck";
    }

    // choose_vehicle recommends a vehicle for selection. It always recommends the vehicle that comes first in lexicographical order.
    std::string choose_vehicle(std::string option1, std::string option2)
    {
        auto vehicle = option1 <= option2 ? option1 : option2;
        return vehicle + " is clearly the better choice.";
    }

    // calculate_resell_price calculates how much a vehicle can resell for at a certain age.
    double calculate_resell_price(double original_price, double age)
    {
        if (age < 3)
            return original_price * 0.8;
        if (age < 10)
            return original_price * 0.7;

        return original_price * 0.5;
    }

} // namespace vehicle_purchase