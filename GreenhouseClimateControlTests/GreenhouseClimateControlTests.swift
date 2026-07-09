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
        // 300K → 26.85°C (a realistic greenhouse reading)
    }

    func testFahrenheitConversion_roomTemperature_returnsValue() throws {
        // 300K → 80.33°F
    }

    func testCelsiusConversion_boilingPoint_returns100() throws {
        // 373.15K → 100°C (well-known reference value)
    }

    func testFahrenheitConversion_boilingPoint_returns212() throws {
        // 373.15K → 212°F (well-known reference value)
    }

    func testCelsiusAndFahrenheitAreConsistent() throws {
        // F = C × 9/5 + 32 must hold for the same Kelvin input
    }

    // MARK: - 1b: Edge cases and invalid input

    func testAbsoluteZero_returnsValue() throws {
        // 0K is valid — the lower physical boundary
    }

    func testNilInput_returnsNil() throws {
        // Missing sensor reading should produce no output
    }

    func testBelowAbsoluteZero_returnsNil() throws {
        // Physically impossible — treat as sensor fault
    }

    func testBelowCropRange_returnsNil() throws {
        // Below freezing (e.g. 272K ≈ -1°C) — outside agricultural range
    }

    func testAboveCropRange_returnsNil() throws {
        // Above crop survival threshold (e.g. 325K ≈ 52°C) — too hot for any greenhouse crop
    }

    func testSensorSpike_returnsNil() throws {
        // Above 350K (~77°C, well above any temperature recordable on Earth) — faulty sensor reading
    }

}
