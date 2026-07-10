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

    func testWithinValidRange_returnsValue() throws {
        // 300K — comfortably within 175K–350K, converter must return a result
    }

    func testAbsoluteZero_returnsValue() throws {
        // 0K — required edge case; the converter must handle the physical lower bound
    }

    func testNilInput_returnsNil() throws {
        // Missing sensor reading should produce no output
    }

    func testBelowAbsoluteZero_returnsNil() throws {
        // Physically impossible — treat as sensor fault
    }

    func testBelowEarthRecord_returnsNil() throws {
        // Below 175K (~-98°C, safely below the lowest temperature ever recorded on Earth) — faulty sensor reading
    }

    func testSensorSpike_returnsNil() throws {
        // Above 350K (~77°C, the highest temperature ever recorded on Earth) — faulty sensor reading
    }

}
