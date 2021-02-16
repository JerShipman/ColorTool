import XCTest
@testable import ColorTool

final class ColorToolTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ColorTool().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
