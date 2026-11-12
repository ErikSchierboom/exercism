get_vector_of_wagons(args...) = [args...]

function fix_vector_of_wagons(each_wagons_id, missing_wagons)
    fst, snd, thr, rest... = each_wagons_id
    return [thr, missing_wagons..., rest..., fst, snd]
end

function add_missing_stops(route, stops...)
    stop_names = [stop.second for stop in stops]
    Dict(route..., "stops" => stop_names)
end

function extend_route_information(route; more_route_information...)
    Dict(route..., more_route_information...)
end
