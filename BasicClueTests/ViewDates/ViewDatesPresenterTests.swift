import XCTest
@testable import BasicClue

class ViewDatesPresenterTests: XCTestCase {
    
    var mockViewDelegate: MockViewDatesViewing!
    var subject: ViewDatesPresenter!

    override func setUp() {
        mockViewDelegate = MockViewDatesViewing()
        subject = ViewDatesPresenter(view: mockViewDelegate)
    }

    func test_presentDates_displaysDates() {
        subject.presentDates([])
        XCTAssertTrue(mockViewDelegate.didDisplayDates)
    }

    func test_presentDates_ABC_displaysDatesABC() throws {
        let expected = ["A", "B", "C"]
        subject.presentDates(expected)
        let result = try Assert.notNilAndUnwrap(mockViewDelegate.spyDisplayedDates)
        XCTAssertEqual(expected, result)
    }

    func test_presentDates_DEFG_displaysDatesDEFG() throws {
        let expected = ["D", "E", "F", "G"]
        subject.presentDates(expected)
        let result = try Assert.notNilAndUnwrap(mockViewDelegate.spyDisplayedDates)
        XCTAssertEqual(expected, result)
    }

}
