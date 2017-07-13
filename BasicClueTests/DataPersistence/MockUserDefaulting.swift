import Foundation
@testable import BasicClue

class MockUserDefaulting: UserDefaulting {
    var spyDataKey: String? = nil
    var stubData: Data? = nil
    func data(forKey defaultName: String) -> Data? {
        spyDataKey = defaultName
        return stubData
    }
}
