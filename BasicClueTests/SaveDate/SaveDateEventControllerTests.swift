import XCTest
@testable import BasicClue

class SaveDateEventControllerTests: XCTestCase {
    
    var mockPresenter: MockSaveDatePresenter!
    var subject: SaveDateEventController!

    override func setUp() {
        mockPresenter = MockSaveDatePresenter()
        subject = SaveDateEventController(presenter: mockPresenter)
    }
    
    // MARK: selected(date:) tests

    func test_selectedDate_tellsPresenterToPresentDay() {
        subject.selected(date: 0)
        XCTAssertTrue(mockPresenter.didPresentDay)
    }
    
    func test_dateSelected_1_presentsDay15() {
        subject.selected(date: 1)
        XCTAssertEqual(1, mockPresenter.spyPresentedDay)
    }
    
    func test_dateSelected_15_presentsDay15() {
        subject.selected(date: 15)
        XCTAssertEqual(15, mockPresenter.spyPresentedDay)
    }
    
}
