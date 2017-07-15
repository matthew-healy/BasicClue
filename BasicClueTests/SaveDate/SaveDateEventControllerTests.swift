import XCTest
@testable import BasicClue

class SaveDateEventControllerTests: XCTestCase {
    
    var mockPresenter: MockSaveDatePresenter!
    var mockInteractor: MockSaveDateInteracting!
    var subject: SaveDateEventController!

    override func setUp() {
        mockPresenter = MockSaveDatePresenter()
        mockInteractor = MockSaveDateInteracting()
        subject = SaveDateEventController(
            presenter: mockPresenter,
            interactor: mockInteractor
        )
    }
    
    // MARK: interfaceDidLoad tests

    func test_interfaceDidLoad_tellsPresenterToSetUpScreen() {
        subject.interfaceDidLoad()
        XCTAssertTrue(mockPresenter.didSetUpScreen)
    }

    func test_interfaceDidLoad_tellsPresenterToPresentDay1() {
        subject.interfaceDidLoad()
        XCTAssertEqual(1, mockPresenter.spyPresentedDay)
    }

    // MARK: selected(date:) tests

    func test_selectedDate_tellsPresenterToPresentDay() {
        subject.selected(date: 0)
        XCTAssertTrue(mockPresenter.didPresentDay)
    }
    
    func test_selectedDate_1_presentsDay15() {
        subject.selected(date: 1)
        XCTAssertEqual(1, mockPresenter.spyPresentedDay)
    }
    
    func test_selectedDate_15_presentsDay15() {
        subject.selected(date: 15)
        XCTAssertEqual(15, mockPresenter.spyPresentedDay)
    }
    
    // MARK: saveDateButtonTapped(date:) tests

    func test_saveDateButtonTapped_savesDate() {
        subject.saveDateButtonTapped(date: 1)
        XCTAssertTrue(mockInteractor.didSaveDate)
    }

    func test_saveDateButtonTapped_2_saves2() {
        subject.saveDateButtonTapped(date: 2)
        XCTAssertEqual(2, mockInteractor.spySavedDate)
    }

    func test_saveDateButtonTapped_5_saves5() {
        subject.saveDateButtonTapped(date: 5)
        XCTAssertEqual(5, mockInteractor.spySavedDate)
    }

}
