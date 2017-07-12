import XCTest
@testable import BasicClue

class CircularControlLayoutEngineTests: XCTestCase {
    
    var subject: CircularControlLayoutEngine!

    // MARK: radius tests

    func test_radius_sideLength10lineWidth1_returns4() {
        subject = .create(sideLength: 10, lineWidth: 1)
        XCTAssertEqual(4, subject.radius)
    }

    func test_radius_sideLength40lineWidth3_returns17() {
        subject = .create(sideLength: 40, lineWidth: 3)
        XCTAssertEqual(17, subject.radius)
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

    // MARK: handlePosition tests

    func test_handlePosition_sizeIs44By44() {
        let expected = CGSize(width: 44, height: 44)
        subject = .create()
        let result = subject.handlePosition
        XCTAssertEqual(expected, result.size)
    }

    func test_handlePosition_side4width0_defaultAngle_originIsx2y0() {
        let expected = CGPoint(x: 2, y: 0)
        subject = .create(sideLength: 4)
        let result = subject.handlePosition
        Assert.equal(expected, result.origin, accuracy: 0.01)
    }

    func test_handlePosition_side4width0_afterTouchingSouth_originIsx2y4() {
        let expected = CGPoint(x: 2, y: 4)
        subject = .create(sideLength: 4)
        subject.updateAngle(for: expected)
        let result = subject.handlePosition
        Assert.equal(expected, result.origin, accuracy: 0.01)
    }

    func test_handlePosition_side100width22_afterTouchingWestOutsideCircleButNotOnCircle_originIsx0y28() {
        let expected = CGPoint(x: 0, y: 28)
        subject = .create(sideLength: 100, lineWidth: 22)
        subject.updateAngle(for: CGPoint(x: 0, y: 50))
        let result = subject.handlePosition
        Assert.equal(expected, result.origin, accuracy: 0.01)
    }
}

extension CircularControlLayoutEngine {
    static func create(sideLength: CGFloat = 0, lineWidth: CGFloat = 0) -> CircularControlLayoutEngine {
        return CircularControlLayoutEngine(
            sideLength: sideLength,
            lineWidth: lineWidth
        )
    }
}
