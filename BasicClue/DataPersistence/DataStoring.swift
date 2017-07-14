protocol DataStoring {
    func getDateList() -> [String]
    func appendToDateList(newDate: String)
}
