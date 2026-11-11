get_coordinate((_, coordinate)) = coordinate

convert_coordinate(coordinate) = Tuple(coordinate)

compare_records((_, azara_coordinate), (_, rui_coordinate, _)) = Tuple(azara_coordinate) == rui_coordinate

function create_record(azara_record, rui_record)
    if !compare_records(azara_record, rui_record)
        return ()
    end

    azara_treasure, coordinate = azara_record
    rui_treasure, _, quadrant = rui_record
    return (coordinate, rui_treasure, quadrant, azara_treasure)
end
