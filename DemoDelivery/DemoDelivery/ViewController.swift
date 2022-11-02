//
//  ViewController.swift
//  DemoDelivery
//
//  Created by 뚱건 on 2022/11/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var paramTextField: UITextField!
    
    @IBOutlet var paramSwitch: UISwitch!
    
    @IBAction func onSwitch(_ sender: Any) {
        // Any를 UISwitch로 다운캐스팅
        let updateSwitch = sender as! UISwitch
        
        if (updateSwitch.isOn == true) {
            lblUpdate.text = "스위치 켜진 상태"
        } else {
            lblUpdate.text = "스위치 꺼진 상태"
        }
    }
    
    @IBOutlet var lblUpdate: UILabel!
    
    @IBOutlet var paramStepper: UIStepper!
    
    @IBAction func onStepper(_ sender: Any) {
        let intervalStepper = sender as! UIStepper
        lblStepper.text = "\(Int(intervalStepper.value))값"
    }
    
    @IBOutlet var lblStepper: UILabel!
    
    
    @IBOutlet var paramSlider: UISlider!
    
    
    @IBAction func onSlider(_ sender: Any) {
        let slider = sender as! UISlider
        lblResult.text = "슬라이더:\(slider.value)"
    }
    
    
    @IBOutlet var paramSegment: UISegmentedControl!
    
    
    @IBAction func onSegment(_ sender: Any) {
        let segment = sender as! UISegmentedControl
        switch segment.selectedSegmentIndex {
        case 0:
            lblResult.text = "남자"
        case 1:
            lblResult.text = "여자"
        default:
            break
        }
    }
    
    @IBOutlet var lblResult: UILabel!
    
    
    @IBAction func onSubmit(_ sender: Any) {
        // 옵셔널 바인딩
        if let uvc = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
            uvc.paramTextField = self.paramTextField.text!
            uvc.paramSwitch = self.paramSwitch.isOn
            uvc.paramStepper = self.paramStepper.value
            uvc.paramSlider = self.paramSlider.value
            uvc.paramSegment = self.paramSegment.selectedSegmentIndex
            // 화면이동
            self.present(uvc, animated: true, completion: nil)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

