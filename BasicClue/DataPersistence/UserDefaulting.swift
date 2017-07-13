import Foundation

protocol UserDefaulting {
    func data(forKey defaultName: String) -> Data?
}

extension UserDefaults: UserDefaulting { }
