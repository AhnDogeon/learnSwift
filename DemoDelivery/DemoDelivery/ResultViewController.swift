//
//  ResultViewController.swift
//  DemoDelivery
//
//  Created by 뚱건 on 2022/11/02.
//

import UIKit

class ResultViewController: UIViewController {
    // 파라미터값 받기
    var paramTextField:String = ""
    var paramSwitch:Bool = false
    var paramStepper:Double = 0
    var paramSlider:Float = 0
    var paramSegment:Int = 0
    
    
    @IBOutlet var resultTextField: UILabel!
    @IBOutlet var resultSwitch: UILabel!
    @IBOutlet var resultStepper: UILabel!
    @IBOutlet var resultSlider: UILabel!
    @IBOutlet var resultSegment: UILabel!
    
    
    @IBAction func dismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultTextField.text = paramTextField
        self.resultSwitch.text = (paramSwitch == true ? "선택함" : "선택안함")
        self.resultStepper.text = "\(Int(paramStepper)) 세팅"
        self.resultSlider.text = "\(self.paramSlider)"
        switch paramSegment {
        case 0:
            self.resultSegment.text = "남자"
        case 1:
            self.resultSegment.text = "여자"
        default:
            break
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
