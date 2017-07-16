import Foundation

class UserDefaultsDataStore: DataStoring {
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

    func appendToDateList(newDate: String) {
        var list = getDateList()
        list.append(newDate)
        encodeAndSave(list: list)
    }

    private func encodeAndSave(list: [String]) {
        let encoder = JSONEncoder()
        guard let value = try? encoder.encode(list) else { return }
        defaults.set(value, forKey: dateListKey)
    }

    func removeFromDateList(_ date: String) {
        var list = getDateList()
        guard let itemIndex = list.index(of: date) else { return }
        _ = list.remove(at: itemIndex)
        encodeAndSave(list: list)
    }

}
