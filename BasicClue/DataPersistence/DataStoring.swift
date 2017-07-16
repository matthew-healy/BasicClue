protocol DataStoring {
    func getDateList() -> [String]
    func appendToDateList(newDate: String)
    func removeFromDateList(_ date: String)
}
