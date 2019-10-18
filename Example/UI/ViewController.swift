import UIKit
import SliderController

class ViewController: UIViewController, SliderControllerDelegate {

    override func loadView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
        embed(child: sliderController.controller, in: view)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        sliderController.unselectedTrackColor = UIColor.red.withAlphaComponent(0.5)
        sliderController.selectedTrackColor = .green
        sliderController.unselectedAnchorColor = .red
        sliderController.selectedAnchorColor = .green
        sliderController.isThumbHidden = true
        sliderController.anchors = [0, 0.3, 0.6, 1.0]
        sliderController.anchorRadius = 15
        sliderController.trackHeight = 7.5
        sliderController.labels = ["A", "B", "C", "D"]
        sliderController.horizontalLabelOffset = 0
        sliderController.verticalLabelOffset = 0
        sliderController.labelFont = UIFont.boldSystemFont(ofSize: 10)
        sliderController.labelColor = UIColor.black
        sliderController.delegate = self
    }

    let sliderController: SliderControlling = SliderController()

    // MARK: SliderControllerDelegate

    func sliderDidTap(atValue value: Float) {
        print("Did tap at value: \(value)") // TODO: Implement UI
    }

    func sliderValueDidChange(value: Float) {
        print("Slider value did change: \(value)") // TODO: Implement UI
    }

    func sliderDidStartSwiping() {
        print("Slider did start swiping") // TODO: Implement UI
    }

    func sliderDidEndSwiping() {
        print("Slider did end swiping") // TODO: Implement UI
    }

}

extension UIViewController {

    func embed(child: UIViewController, in targetView: UIView) {
        addChild(child)
        targetView.addSubview(child.view)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.view.topAnchor.constraint(equalTo: targetView.topAnchor).isActive = true
        child.view.leftAnchor.constraint(equalTo: targetView.leftAnchor).isActive = true
        child.view.rightAnchor.constraint(equalTo: targetView.rightAnchor).isActive = true
        child.view.bottomAnchor.constraint(equalTo: targetView.bottomAnchor).isActive = true
        child.didMove(toParent: self)
    }

}
