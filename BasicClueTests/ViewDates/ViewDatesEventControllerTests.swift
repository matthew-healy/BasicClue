import XCTest
@testable import BasicClue

class ViewDatesEventControllerTests: XCTestCase {
    
    var mockInteractor: MockViewDatesInteracting!
    var mockPresenter: MockViewDatesPresenting!
    var subject: ViewDatesEventController!
    
    override func setUp() {
        mockInteractor = MockViewDatesInteracting()
        mockPresenter = MockViewDatesPresenting()
        subject = ViewDatesEventController(
            presenter: mockPresenter,
            interactor: mockInteractor
        )
    }

    func test_interfaceDidLoad_getsDatesFromInteractor() {
        subject.interfaceDidLoad()
        XCTAssertTrue(mockInteractor.didGetDates)
    }

    func test_interfaceDidLoad_presentsDates() {
        subject.interfaceDidLoad()
        XCTAssertTrue(mockPresenter.didPresentDates)
    }

    func test_interfaceDidLoad_getDatesReturnsDEF_presentsDEF() throws {
        let expected = ["D", "E", "F"]
        mockInteractor.stubGetDates = expected
        subject.interfaceDidLoad()
        let result = try Assert.notNilAndUnwrap(mockPresenter.spyPresentedDates)
        XCTAssertEqual(expected, result)
    }

    func test_interfaceDidLoad_getDatesReturnsHi_presentsHi() throws {
        let expected = ["Hi"]
        mockInteractor.stubGetDates = expected
        subject.interfaceDidLoad()
        let result = try Assert.notNilAndUnwrap(mockPresenter.spyPresentedDates)
        XCTAssertEqual(expected, result)
    }
    
}
