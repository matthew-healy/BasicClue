import XCTest
@testable import BasicClue

class SaveDateInteractorTests: XCTestCase {
    
    var mockStore: MockDataStoring!
    var subject: SaveDateInteractor!
    
    override func setUp() {
        mockStore = MockDataStoring()
        subject = SaveDateInteractor(dataStore: mockStore)
    }

    // MARK: toggleDateSelection tests

    func test_saveDate_appendsToDateList() {
        subject.toggleDateSelection(0)
        XCTAssertTrue(mockStore.didAppendToDateList)
    }

    func test_saveDate_1_appendsJanuary1ToDateList() {
        subject.toggleDateSelection(1)
        XCTAssertEqual("January 1", mockStore.spyNewDate)
    }

    func test_saveDate_305_appendsJanuary305ToDateList() {
        subject.toggleDateSelection(305)
        XCTAssertEqual("January 305", mockStore.spyNewDate)
    }
    
    func test_saveDate_dateIsAlreadyInList_doesNotAppendSecondTime() {
        mockStore.stubDateList = ["January 111"]
        subject.toggleDateSelection(111)
        XCTAssertFalse(mockStore.didAppendToDateList)
    }

    // MARK: isDateSelected tests

    func test_isDateSelected_emptyList_false() {
        let result = subject.isDateSelected(1)
        XCTAssertFalse(result)
    }

    func test_isDateSelected_dateIsInList_true() {
        mockStore.stubDateList = ["January 2"]
        let result = subject.isDateSelected(2)
        XCTAssertTrue(result)
    }

    func test_isDateSelected_listNonEmptyButDateNotIncluded_false() {
        mockStore.stubDateList = ["January 5"]
        let result = subject.isDateSelected(3)
        XCTAssertFalse(result)
    }

}
