import XCTest
@testable import BasicClue

class CircularControlLayoutEngineTests: XCTestCase {
    
    // MARK: radius tests

    func test_radius_sideLength10lineWidth1_returns3() {
        let subject = CircularControlLayoutEngine(sideLength: 10, lineWidth: 1)
        XCTAssertEqual(3, subject.radius)
    }

    func test_radius_sideLength40lineWidth3_returns14() {
        let subject = CircularControlLayoutEngine(sideLength: 40, lineWidth: 3)
        XCTAssertEqual(14, subject.radius)
    }
}
