function humiditycheck(pct_humidity)
    if pct_humidity > 70
        error("humidity level check failed: $pct_humidity%")
    end

    @info "humidity level check passed: $pct_humidity%"
end

function temperaturecheck(temperature)
    temperature === nothing && throw(ArgumentError("sensor is broken"))
    temperature > 500 && throw(DomainError(temperature, "overheating detected"))

    @info "temperature check passed: $temperature °C"
end

struct MachineError <: Exception end

function machinemonitor(pct_humidity, temperature)
    has_error = false

    try
        humiditycheck(pct_humidity)
    catch problem
        if problem isa ErrorException
            @error "humidity level check failed: $pct_humidity%"
            has_error = true
        else
            rethrow(problem)
        end
    end

    try
        temperaturecheck(temperature)
    catch problem
        if problem isa ArgumentError
            @warn "sensor is broken"
            has_error = true
        elseif problem isa DomainError
            @error "overheating detected: $temperature °C"
            has_error = true
        else
            rethrow(problem)
        end
    end

    has_error && throw(MachineError())
end
