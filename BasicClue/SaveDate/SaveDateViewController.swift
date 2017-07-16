import UIKit

class SaveDateViewController: UIViewController {

    private var eventController: SaveDateEventController? = nil

    @IBOutlet weak var saveDateButton: UIButton!
    @IBOutlet weak var calendarButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWireframe()
        setUpSaveDateButton()
        eventController?.interfaceDidLoad()
    }

    private func setUpWireframe() {
        let presenter = SaveDatePresenter(view: self)
        let dataStore = UserDefaultsDataStore(userDefaults: UserDefaults.standard)
        let interactor = SaveDateInteractor(dataStore: dataStore)
        eventController = SaveDateEventController(presenter: presenter, interactor: interactor)
    }

    private func setUpSaveDateButton() {
        saveDateButton.layer.masksToBounds = true
        saveDateButton.setBackgroundImage(.from(color: .cyan), for: .selected)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        saveDateButton.layer.cornerRadius = saveDateButton.frame.width / 2
    }

    @IBAction func circularControlValueDidChange(_ sender: CircularControl) {
        eventController?.selected(date: sender.selectedValue)
    }

    @IBAction func didPressDateButton(_ sender: UIButton) {
        eventController?.saveDateButtonTapped()
    }
}

extension SaveDateViewController: SaveDateViewing {
    func setCalendarButtonTitle(to title: String) {
        calendarButton.setTitle(title, for: .normal)
    }

    func display(viewModel: DateViewModel) {
        saveDateButton.setTitle(viewModel.day, for: .normal)
        saveDateButton.isSelected = viewModel.isSelected
    }
}

private extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
}
