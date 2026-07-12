# Greenhouse Climate Control — Temperature Conversion Logic

Unit-tested Swift logic for converting greenhouse sensor readings from Kelvin to Celsius and Fahrenheit, built for CS4405 (Mobile Application Development) at the University of the People.

## Overview

Greenhouse sensors report temperature in Kelvin. Before that data reaches a farmer's monitoring dashboard, it must be converted to Celsius and Fahrenheit — and validated, since a bad conversion or an unhandled sensor fault could display a misleading reading and put crops at risk.

This project implements that conversion logic as a small Swift struct, `TemperatureConverter`, along with an XCTest suite that verifies both standard conversions and edge-case handling.

## Features

- Kelvin → Celsius and Kelvin → Fahrenheit conversion
- Optional-based input/output, so missing sensor data (`nil`) is handled gracefully instead of crashing
- Input validation against a realistic sensor range (175K–350K), grounded in Earth's recorded temperature extremes
- Rejects physically impossible readings (below absolute zero) and implausible sensor spikes

## Project Structure

```
.
├── Sources/
│   └── TemperatureConverter.swift           # Conversion logic
├── Tests/
│   └── TemperatureConverterTests.swift      # XCTest suite
└── README.md
```

## Requirements

- Xcode 15+
- Swift 5.9+

## Running the Tests

Open the project in Xcode and run:

`Cmd + U`

Or from the command line:

```bash
swift test
```

## Test Coverage

The test suite is organized into two categories:

**Standard conversions**
- `testCelsiusConversion_roomTemperature_returnsValue`
- `testFahrenheitConversion_roomTemperature_returnsValue`
- `testCelsiusAndFahrenheitAreConsistent`

**Edge cases and invalid input**
- `testAbsoluteZero_returnsNil`
- `testNilInput_returnsNil`
- `testBelowAbsoluteZero_returnsNil`
- `testBelowEarthRecord_returnsNil`
- `testSensorSpike_returnsNil`

Together, these provide full branch coverage of `TemperatureConverter`'s valid, nil, and out-of-range paths, confirmed via Xcode's built-in code coverage report.

## Sensor Range Rationale

The valid sensor range (175K–350K) is derived from Earth's recorded surface temperature extremes, with a safety margin:

- **Lowest:** ~184K (−89.2°C), recorded at Vostok Station, Antarctica, in 1983
- **Highest:** ~330K (56.7°C), recorded at Furnace Creek, Death Valley, California, in 1913

## Author

Fabio Aiello — CS4405, University of the People
