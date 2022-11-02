//
//  MainViewController.swift
//  DemoSegway
//
//  Created by 뚱건 on 2022/11/02.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func wind(_ sender: Any) {
        // 메뉴얼세그 호출
        performSegue(withIdentifier: "ManualWind", sender: self)
    }
    
    // 되감기(exit)
    @IBAction func unwindToFirstViewController(seque: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
