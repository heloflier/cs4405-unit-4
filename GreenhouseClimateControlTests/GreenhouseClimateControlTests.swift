//
//  GreenhouseClimateControlTests.swift
//  GreenhouseClimateControlTests
//
//  Created by Fabio Aiello on 7/8/26.
//

import XCTest
@testable import GreenhouseClimateControl

final class GreenhouseClimateControlTests: XCTestCase {

    // MARK: - 1a: Standard conversions

    func testCelsiusConversion_roomTemperature_returnsValue() throws {
        let result = try XCTUnwrap(TemperatureConverter.toCelsius(kelvin: 300))
        XCTAssertEqual(result, 26.85, accuracy: 0.01)
    }

    func testFahrenheitConversion_roomTemperature_returnsValue() throws {
        let result = try XCTUnwrap(TemperatureConverter.toFahrenheit(kelvin: 300))
        XCTAssertEqual(result, 80.33, accuracy: 0.01)
    }

    func testCelsiusAndFahrenheitAreConsistent() throws {
        let celsius = try XCTUnwrap(TemperatureConverter.toCelsius(kelvin: 300))
        let fahrenheit = try XCTUnwrap(TemperatureConverter.toFahrenheit(kelvin: 300))
        XCTAssertEqual(fahrenheit, celsius * 9 / 5 + 32, accuracy: 0.001)
    }

    // MARK: - 1b: Edge cases and invalid input

    func testAbsoluteZero_returnsNil() throws {
        // Required by assignment: 0K is the physical lower bound and must be handled gracefully.
        // Unreachable in any real greenhouse; converter rejects it as outside the valid sensor range.
        XCTAssertNil(TemperatureConverter.toCelsius(kelvin: 0))
        XCTAssertNil(TemperatureConverter.toFahrenheit(kelvin: 0))
    }

    func testNilInput_returnsNil() throws {
        // Required by assignment: missing sensor reading must produce no output
        XCTAssertNil(TemperatureConverter.toCelsius(kelvin: nil))
        XCTAssertNil(TemperatureConverter.toFahrenheit(kelvin: nil))
    }

    func testBelowAbsoluteZero_returnsNil() throws {
        // Physically impossible — any negative Kelvin value is a sensor fault
        XCTAssertNil(TemperatureConverter.toCelsius(kelvin: -10))
        XCTAssertNil(TemperatureConverter.toFahrenheit(kelvin: -10))
    }

    func testBelowEarthRecord_returnsNil() throws {
        // Below 175K (~-98°C, safely below the lowest temperature ever recorded on Earth) — faulty sensor reading
        XCTAssertNil(TemperatureConverter.toCelsius(kelvin: 170))
        XCTAssertNil(TemperatureConverter.toFahrenheit(kelvin: 170))
    }

    func testSensorSpike_returnsNil() throws {
        // Above 350K (~77°C, well above the highest temperature ever recorded on Earth) — faulty sensor reading
        XCTAssertNil(TemperatureConverter.toCelsius(kelvin: 400))
        XCTAssertNil(TemperatureConverter.toFahrenheit(kelvin: 400))
    }

}
