import XCTest
@testable import BasicClue

class SaveDatePresenterTests: XCTestCase {
    
    private var subject: SaveDatePresenter!
    private var mockView: MockSaveDateViewDelegate!
    
    override func setUp() {
        mockView = MockSaveDateViewDelegate()
        subject = SaveDatePresenter(view: mockView)
    }

    // MARK: setUpScreen tests

    func test_setUpScreen_setsCalendarButtonTitle() {
        subject.setUpScreen()
        XCTAssertTrue(mockView.didSetCalendarButtonTitle)
    }

    func test_setUpScreen_setsCalendarButtonTitleCorrectly() {
        subject.setUpScreen()
        XCTAssertEqual("Calendar", mockView.spyCalendarButtonTitle)
    }

    // MARK: presentSelectedDay tests

    func test_presentDay_callsDisplayViewModelOnViewDelegate() {
        subject.present(day: 1)
        XCTAssertTrue(mockView.didCallDisplayViewModel)
    }

    func test_presentDay_day1_displaysJanuary1() {
        subject.present(day: 1)
        XCTAssertEqual("January 1", mockView.spyDisplayViewModel?.day)
    }

    func test_presentDay_day31_displaysJanuary31() {
        subject.present(day: 31)
        XCTAssertEqual("January 31", mockView.spyDisplayViewModel?.day)
    }
    
}
