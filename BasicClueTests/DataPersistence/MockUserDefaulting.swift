import Foundation
@testable import BasicClue

class MockUserDefaulting: UserDefaulting {
    var spySetKey: String? = nil
    var spyValue: Any? = nil
    func set(_ value: Any?, forKey defaultName: String) {
        spyValue = value
        spySetKey = defaultName
    }

    var spyDataKey: String? = nil
    var stubData: Data? = nil
    func data(forKey defaultName: String) -> Data? {
        spyDataKey = defaultName
        return stubData
    }
}
