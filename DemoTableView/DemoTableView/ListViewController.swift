//
//  ListViewController.swift
//  DemoTableView
//
//  Created by 뚱건 on 2022/11/03.
//

import UIKit

// 배열로 된 JSON데이터 파싱해오기
struct Root:Decodable {
    let results:[ResultsData]
}

struct ResultsData:Decodable {
    let name:NameData
    let location:LocationData
    let cell:String
    let picture:PictureData
    
    // 클로저
    func retrieveImage(completionHandler: @escaping (UIImage?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with:URL(string: picture.large)!)
        {
            data, _, error in
            guard let data = data, error == nil else {
                // 문제있을 때 빠져나가는 부분
                completionHandler(nil, error)
                return
            }
            completionHandler(UIImage(data:data), nil)
        }
        // 지속적으로 수행
        task.resume()
    }
}

// 서브키가 있는 경우는 다시 구조체로 정의
struct NameData:Decodable {
    let first:String
    let last:String
}

struct LocationData:Decodable {
    let street:StreetData
}

struct StreetData:Decodable {
    let name:String
}

struct PictureData:Decodable {
    let large:String
}


class ListViewController: UITableViewController {
    
    @IBOutlet var userTableView: UITableView!
    
    
    
    // 출력한 배열 데이터
    var list = Array<ResultsData>()
    
    // 데이터 웹서버 통신(웹사이트에 데이터 받아오기)
    func getRandomUsers() {
        guard let url = URL(string: "https://randomuser.me/api/?results=20") else {
            return
        }
                
                let request = URLRequest(url:url)
                let task = URLSession.shared.dataTask(with:request, completionHandler: {
                    (data, response, error) -> Void in
                    if let error = error {
                        print(error)
                        return
                    }
                    if let data = data {
                        self.list =  self.parseJsonData(data:data)
                        // 리로드
                        OperationQueue.main.addOperation({
                            self.tableView.reloadData()
                        })
                    }
                })
                task.resume()
    }
    
    
    func parseJsonData(data: Data) -> [ResultsData] {

        var list = [ResultsData]()

        do {
            let root = try JSONDecoder().decode(Root.self, from: data)
            print(root.results)
            print(root.results.count)
            list = root.results
            
        } catch {
            print(error)
        }

        return list
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getRandomUsers()
        
        // 데이터 하드코딩
//        var user = UserVO()
//        user.firstName = "길동"
//        user.lastName = "홍"
//        user.street = "선릉역"
//        user.mobile = "010-222-1234"
//        user.picture = "01"
//        self.list.append(user)
//
//
//        user = UserVO()
//        user.firstName = "우치"
//        user.lastName = "전"
//        user.street = "삼성역"
//        user.mobile = "010-333-1234"
//        user.picture = "02"
//        self.list.append(user)
//
//
//        user = UserVO()
//        user.firstName = "문수"
//        user.lastName = "박"
//        user.street = "역삼역"
//        user.mobile = "010-555-1234"
//        user.picture = "03"
//        self.list.append(user)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // 그룹의 갯수
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 특정 섹션의 배열의 갯수
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 특정 셀의 컨텐츠
        
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! UserCell
        
        // 1) viewWithTag()
//        let lastName = cell.viewWithTag(101) as? UILabel
//        let firstName = cell.viewWithTag(102) as? UILabel
//        let street = cell.viewWithTag(103) as? UILabel
//        let cellphone = cell.viewWithTag(104) as? UILabel
//
//        lastName?.text = row.lastName
//        firstName?.text = row.firstName
//        street?.text = row.street
//        cellphone?.text = row.mobile
        
        // 2) 변수명으로 접근
        // UITableViewCell ==? UserCell로 다운캐스팅
        
//        cell.lastName?.text = row.lastName
//        cell.firstName?.text = row.firstName
//        cell.street?.text = row.street
//        cell.cellPhone?.text = row.mobile
        
        // 기존이름에서 변경
        cell.lastName?.text = row.name.last
        cell.firstName?.text = row.name.first
        cell.street?.text = row.location.street.name
        cell.cellPhone?.text = row.cell
        
        //이미지의 경우 비동기 형태의 처리가 필요하다.
        row.retrieveImage { image, error in
            //UI에 대한 접근은 UI를 소유하고 있는 메인 쓰레드에서 처리해야 한다.
            DispatchQueue.main.async {
                cell.thumbnail.image = image
            }
        }
        
        // 디버깅용 코드
        print("cell 생성을 종료 : \(indexPath.row)행")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("touch cell \(indexPath.row)")
    }

    
    // 세그로 뷰스위칭을 하기 전에 데이터 담기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segue_detail") {
            let path = self.userTableView.indexPath(for: sender as! UserCell)
            (segue.destination as? DetailViewController)?.user = self.list[path!.row]
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


