//
//  TemperatureConverter.swift
//  GreenhouseClimateControl
//

struct TemperatureConverter {

    // Valid sensor range based on Earth's recorded temperature extremes,
    // with margins on both ends to account for sensor tolerance.
    private static let minValidKelvin: Double = 175.0  // safely below -89°C (Antarctica, 1983)
    private static let maxValidKelvin: Double = 350.0  // safely above 56.7°C (Death Valley, 1913)

    private static func isValidReading(_ kelvin: Double) -> Bool {
        return kelvin >= 0 && kelvin >= minValidKelvin && kelvin <= maxValidKelvin
    }

    static func toCelsius(kelvin: Double?) -> Double? {
        guard let k = kelvin, isValidReading(k) else { return nil }
        return k - 273.15
    }

    static func toFahrenheit(kelvin: Double?) -> Double? {
        guard let k = kelvin, isValidReading(k) else { return nil }
        return (k - 273.15) * 9 / 5 + 32
    }
}
