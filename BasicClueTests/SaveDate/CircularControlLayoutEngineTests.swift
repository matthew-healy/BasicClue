import XCTest
@testable import BasicClue

class CircularControlLayoutEngineTests: XCTestCase {
    
    var subject: CircularControlLayoutEngine!

    // MARK: radius tests

    func test_radius_sideLength10lineWidth1_returns3() {
        subject = .create(sideLength: 10, lineWidth: 1)
        XCTAssertEqual(3, subject.radius)
    }

    func test_radius_sideLength40lineWidth3_returns14() {
        subject = .create(sideLength: 40, lineWidth: 3)
        XCTAssertEqual(14, subject.radius)
    }

    // MARK: center tests

    func test_center_sideLength8_returns_x4y4() {
        let expected = CGPoint(x: 4, y: 4)
        subject = .create(sideLength: 8)
        XCTAssertEqual(expected, subject.center)
    }

    func test_center_sideLength155_returns_x7point5y7point5() {
        let expeted = CGPoint(x: 7.5, y: 7.5)
        subject = .create(sideLength: 15)
        XCTAssertEqual(expeted, subject.center)
    }
}

extension CircularControlLayoutEngine {
    static func create(sideLength: Double = 0, lineWidth: Double = 0) -> CircularControlLayoutEngine {
        return CircularControlLayoutEngine(
            sideLength: sideLength,
            lineWidth: lineWidth
        )
    }
}
