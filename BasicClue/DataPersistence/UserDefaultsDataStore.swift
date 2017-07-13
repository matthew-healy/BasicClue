import Foundation

class UserDefaultsDataStore {
    private let dateListKey = "dateList"
    private let defaults: UserDefaulting

    init(userDefaults: UserDefaulting) {
        defaults = userDefaults
    }

    func getDateList() -> [String] {
        guard
            let data = defaults.data(forKey: dateListKey),
            let result = try? JSONDecoder().decode([String].self, from: data)
        else { return [] }
        return result
    }

}
