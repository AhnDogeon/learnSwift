//
//  ViewController.swift
//  DemoApp
//
//  Created by 뚱건 on 2022/11/01.
//

import UIKit
import MyComp

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var account1 = BankAccount(id: 100, name: "이순신", amount: 15000)
        print("\(account1.ID) , \(account1.Balance)")
    }


}

