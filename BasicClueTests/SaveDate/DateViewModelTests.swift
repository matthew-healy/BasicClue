import XCTest
@testable import BasicClue

class DateViewModelTests: XCTestCase {
    
    var subject: DateViewModel!

    func test_day_exists() {
        subject = .create(day: "January 1")
        XCTAssertEqual("January 1", subject.day)
    }

    func test_day_isNotHardcoded() {
        subject = .create(day: "January 5")
        XCTAssertEqual("January 5", subject.day)
    }

    func test_selected_exists() {
        subject = .create(isSelected: true)
        XCTAssertTrue(subject.isSelected)
    }
    
    func test_selected_isNotHardcoded() {
        subject = .create()
        XCTAssertFalse(subject.isSelected)
    }
    
    var lhs: DateViewModel!
    var rhs: DateViewModel!

    func test_equals_propertiesMatch_true() {
        (lhs, rhs) = (.create(), .create())
        XCTAssert(lhs == rhs)
    }

    func test_equals_daysDiffer_false() {
        (lhs, rhs) = (.create(day: "A"), .create())
        XCTAssert(lhs != rhs)
    }
    
    func test_equals_isSelectedDiffers_false() {
        (lhs,rhs) = (.create(isSelected: true), .create())
        XCTAssert(lhs != rhs)
    }
    
}

extension DateViewModel {
    static func create(
        day: String = "",
        isSelected: Bool = false
    ) -> DateViewModel {
        return DateViewModel(
            day: day,
            isSelected: isSelected
        )
    }
}
