import XCTest

struct Assert {
    static func equal(_ lhs: CGPoint, _ rhs: CGPoint, accuracy: CGFloat, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqualWithAccuracy(lhs.x, rhs.x, accuracy: accuracy, "x values not equal", file: file, line: line)
        XCTAssertEqualWithAccuracy(lhs.y, rhs.y, accuracy: accuracy, "y values not equal", file: file, line: line)
    }

    enum TestError: Error {
        case unexpectedNil
    }

    static func notNilAndUnwrap<T>(_ maybeValue: T?) throws -> T {
        guard let value = maybeValue else {
            throw TestError.unexpectedNil
        }
        return value
    }
}
