import UIKit

class SaveDateViewController: UIViewController {

    @IBOutlet weak var saveDateButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        saveDateButton.layer.masksToBounds = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        saveDateButton.layer.cornerRadius = saveDateButton.frame.width / 2
    }
}
