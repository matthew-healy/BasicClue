protocol SaveDateViewing: class {
    func setPageTitle(to title: String)
    func setCalendarButtonTitle(to title: String)
    func display(viewModel: DateViewModel)
}
