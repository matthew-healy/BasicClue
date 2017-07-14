import UIKit

class SaveDateViewController: UIViewController {

    private var eventController: SaveDateEventController? = nil

    @IBOutlet weak var saveDateButton: UIButton!
    @IBOutlet weak var calendarButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWireframe()
        eventController?.interfaceDidLoad()
        saveDateButton.layer.masksToBounds = true
    }

    private func setUpWireframe() {
        let presenter = SaveDatePresenter(view: self)
        eventController = SaveDateEventController(presenter: presenter)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        saveDateButton.layer.cornerRadius = saveDateButton.frame.width / 2
    }

    @IBAction func circularControlValueDidChange(_ sender: CircularControl) {
        eventController?.selected(date: sender.selectedValue)
    }

    @IBAction func didPressDateButton(_ sender: UIButton) {

    }
}

extension SaveDateViewController: SaveDateViewing {
    func setCalendarButtonTitle(to title: String) {
        calendarButton.setTitle(title, for: .normal)
    }

    func display(viewModel: String) {
        saveDateButton.setTitle(viewModel, for: .normal)
    }
}
