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
        subject.saveDateButtonTapped()
        XCTAssertTrue(mockInteractor.didSaveDate)
    }

    func test_saveDateButtonTapped_2selected_saves2() {
        subject.selected(date: 2)
        subject.saveDateButtonTapped()
        XCTAssertEqual(2, mockInteractor.spySavedDate)
    }

    func test_saveDateButtonTapped_5selected_saves5() {
        subject.selected(date: 5)
        subject.saveDateButtonTapped()
        XCTAssertEqual(5, mockInteractor.spySavedDate)
    }

}
