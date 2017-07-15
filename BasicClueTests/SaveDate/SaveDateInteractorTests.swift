import XCTest
@testable import BasicClue

class SaveDateInteractorTests: XCTestCase {
    
    var mockStore: MockDataStoring!
    var subject: SaveDateInteractor!
    
    override func setUp() {
        mockStore = MockDataStoring()
        subject = SaveDateInteractor(dataStore: mockStore)
    }

    func test_saveDate_appendsToDateList() {
        subject.saveDate(0)
        XCTAssertTrue(mockStore.didAppendToDateList)
    }

    func test_saveDate_1_appendsJanuary1ToDateList() {
        subject.saveDate(1)
        XCTAssertEqual("January 1", mockStore.spyNewDate)
    }

    func test_saveDate_305_appendsJanuary305ToDateList() {
        subject.saveDate(305)
        XCTAssertEqual("January 305", mockStore.spyNewDate)
    }
    
}
