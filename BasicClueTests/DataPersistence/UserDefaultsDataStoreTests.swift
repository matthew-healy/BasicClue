import XCTest
@testable import BasicClue

class UserDefaultsDataStoreTests: XCTestCase {
    
    var mockDefaults: MockUserDefaulting!
    var subject: UserDefaultsDataStore!
    
    override func setUp() {
        mockDefaults = MockUserDefaulting()
        subject = UserDefaultsDataStore(userDefaults: mockDefaults)
    }

    // MARK: getDateList tests

    func test_getDateList_passesDateListKeyToUserDefaults() {
        _ = subject.getDateList()
        XCTAssertEqual("dateList", mockDefaults.spyDataKey)
    }

    func test_getDateList_defaultsReturnsNil_returnsEmptyArray() {
        let result = subject.getDateList()
        XCTAssertEqual(result, [])
    }

    func test_getDateList_defaultsReturnBadJson_returnEmptyArray() {
        let badJson = "{\"notjson\":"
        mockDefaults.stubData = Data(base64Encoded: badJson)
        let result = subject.getDateList()
        XCTAssertEqual(result, [])
    }

    func test_getDateList_defaultsReturnsData_parsesDataCorrectly() throws {
        let expected = ["a", "b", "c"]
        mockDefaults.stubData = try data(fromList: expected)
        let result = subject.getDateList()
        XCTAssertEqual(result, expected)
    }

    private func data(fromList list: [String]) throws -> Data {
        let encoder = JSONEncoder()
        return try encoder.encode(list)
    }

    func test_getDateList_parsedDataIsNotHardcoded() throws {
        let expected = ["first", "second", "third", "fourth"]
        mockDefaults.stubData = try data(fromList: expected)
        let result = subject.getDateList()
        XCTAssertEqual(result, expected)
    }
    
    // MARK: appendToDateList tests

    func test_appendToDateList_usesCorrectDefaultsKey() {
        subject.appendToDateList(newDate: "")
        XCTAssertEqual("dateList", mockDefaults.spySetKey)
    }

    func test_appendToDateList_abc_listIsEmpty_addsAbcToList() throws {
        mockDefaults.stubData = try data(fromList: [])
        subject.appendToDateList(newDate: "abc")
        let spyValue = try Assert.notNilAndUnwrap(typedValue())
        XCTAssertEqual(try data(from: ["abc"]), spyValue)
    }

    private func typedValue() -> Data? {
        return mockDefaults.spyValue as? Data
    }

    private func data(from list: [String]) throws -> Data {
        let encoder = JSONEncoder()
        return try encoder.encode(list)
    }

    func test_appendToDateList_def_listIsEmpty_addsDefToList() throws {
        mockDefaults.stubData = try data(fromList: [])
        subject.appendToDateList(newDate: "def")
        let spyValue = try Assert.notNilAndUnwrap(typedValue())
        XCTAssertEqual(try data(from: ["def"]), spyValue)
    }

    func test_appendToDateList_hello_listNonEmpty_contentsRemain() throws {
        mockDefaults.stubData = try data(fromList: ["abc", "def"])
        subject.appendToDateList(newDate: "hello")
        let spyValue = try Assert.notNilAndUnwrap(typedValue())
        XCTAssertEqual(try data(from: ["abc", "def", "hello"]), spyValue)
    }

}
