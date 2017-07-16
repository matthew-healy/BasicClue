import XCTest
@testable import BasicClue

class ViewDatesInteractorTests: XCTestCase {
    
    var mockStore: MockDataStoring!
    var subject: ViewDatesInteractor!

    override func setUp() {
        mockStore = MockDataStoring()
        subject = ViewDatesInteractor(dataStore: mockStore)
    }
    
    func test_getDates_getsDateListFromStore() {
        subject.getDates()
        XCTAssertTrue(mockStore.didGetDateList)
    }
    
    func test_getDates_dateListIsABC_returnsABC() {
        let expected = ["A", "B", "C"]
        mockStore.stubDateList = expected
        let result = subject.getDates()
        XCTAssertEqual(expected, result)
    }
    
    func test_getDates_dateListIsHey_returnsHey() {
        let expected = ["Hey"]
        mockStore.stubDateList = expected
        let result = subject.getDates()
        XCTAssertEqual(expected, result)
    }
    
}
