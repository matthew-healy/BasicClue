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

    func test_toggleDateSelection_appendsToDateList() {
        subject.toggleDateSelection(0)
        XCTAssertTrue(mockStore.didAppendToDateList)
    }

    func test_toggleDateSelection_1_appendsJanuary1ToDateList() {
        subject.toggleDateSelection(1)
        XCTAssertEqual("January 1", mockStore.spyNewDate)
    }

    func test_toggleDateSelection_305_appendsJanuary305ToDateList() {
        subject.toggleDateSelection(305)
        XCTAssertEqual("January 305", mockStore.spyNewDate)
    }
    
    func test_toggleDateSelection_dateIsAlreadyInList_doesNotAppendSecondTime() {
        mockStore.stubDateList = ["January 111"]
        subject.toggleDateSelection(111)
        XCTAssertFalse(mockStore.didAppendToDateList)
    }

    func test_toggleDateSelection_dateAlreadyInList_removesDate() {
        mockStore.stubDateList = ["January 25"]
        subject.toggleDateSelection(25)
        XCTAssertTrue(mockStore.didRemoveFromDateList)
    }

    func test_toggleDateSelected_dateAlreadyInList_removesCorrectDate() {
        mockStore.stubDateList = ["January 1"]
        subject.toggleDateSelection(1)
        XCTAssertEqual("January 1", mockStore.spyRemovedDate)
    }

    func test_toggleDateSelected_dateAlreadyInList_removedDateIsNotHardcoded() {
        mockStore.stubDateList = ["January 5"]
        subject.toggleDateSelection(5)
        XCTAssertEqual("January 5", mockStore.spyRemovedDate)
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
