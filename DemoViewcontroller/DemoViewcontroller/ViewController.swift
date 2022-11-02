//
//  ViewController.swift
//  DemoViewcontroller
//
//  Created by 뚱건 on 2022/11/01.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func MoveByNavi(_ sender: Any) {
        if let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC"){
            // 네비게이션컨트롤러를 사용한 전환
            self.navigationController?.pushViewController(uvc, animated: true)
        }
    }
    
    
    
    @IBAction func changeViewController(_ sender: Any) {
        // 1) 스토리보드에서 씬을 읽어오기
        // let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SecondVC")
        // 2) 스토리보드가 여러 개인 경우 찾기
        // let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // let uvc = storyboard.instantiateViewController(withIdentifier: "SecondVC")
        // 3) if let으로 옵셔널 바인딩 처리
        if let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC"){
            // 화면 전환시 애니메이션
            uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            // 프레젠테이션방식으로 전환
            self.present(uvc, animated: true, completion: nil) // completion 은 완료했을 때 코드는 추가로 없어! 라고 nil
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

