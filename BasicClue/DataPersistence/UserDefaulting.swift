import Foundation

protocol UserDefaulting {
    func data(forKey defaultName: String) -> Data?
    func set(_ value: Any?, forKey defaultName: String)
}

extension UserDefaults: UserDefaulting { }
