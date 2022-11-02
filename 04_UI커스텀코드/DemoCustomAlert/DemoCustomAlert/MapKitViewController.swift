//
//  MapKitViewController.swift
//  DemoCustomAlert
//
//  Created by papasmf on 2018. 9. 10..
//  Copyright © 2018년 multicampus. All rights reserved.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //맵킷뷰를 추가 (추가한 파일의 기존 코드를 복사해서 아래와 같이 수정한다.)
        //루트뷰 내부에 서브 뷰를 추가하는 방식으로 화면을 구성한다.
        //이런 경우 루트 뷰는 기본 좌표는 (0,0)이며, 설령 다른 값을
        //설정해 두어도 루트뷰로 지정된 경우 기존 설정된 값이 모두 무시된다.
        //그래서 폭과 높이도 (0,0)으로 지정됨
        //루트 뷰는 항상 화면 전체를 채우는 방식으로 크기가 자동 지정되기 때문이다.
        let mapkitView =
            MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.view = mapkitView
        //높이를 변경한다.
        self.preferredContentSize.height = 200
        
        //다시 추가
        //위치 정보를 설정 (위도/경도)
        let pos = CLLocationCoordinate2D(latitude: 37.501252,
                                         longitude: 127.039613)
        //지도에서 보여줄 넓이. 일종의 축척으로 숫자가 작을 수록
        //좁은 범위를 확대시켜서 보여준다.
        let span = MKCoordinateSpan(latitudeDelta: 0.005,
                                    longitudeDelta: 0.005)
        //지도 영역을 정의
        let region = MKCoordinateRegion(center: pos, span: span)
        //지도 뷰에 표시
        mapkitView.region = region
        mapkitView.regionThatFits(region)
        //위치를 핀으로 표시
        let point = MKPointAnnotation()
        point.coordinate = pos
        mapkitView.addAnnotation(point)

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
