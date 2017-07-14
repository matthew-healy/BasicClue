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
        subject.saveDate("")
        XCTAssertTrue(mockStore.didAppendToDateList)
    }

    func test_saveDate_abc_appendsAbcToDateList() {
        subject.saveDate("abc")
        XCTAssertEqual("abc", mockStore.spyNewDate)
    }

    func test_saveDate_def_appendsDefToDateList() {
        subject.saveDate("def")
        XCTAssertEqual("def", mockStore.spyNewDate)
    }
    
}
