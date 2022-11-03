//
//  ListViewController.swift
//  DemoTableView
//
//  Created by 뚱건 on 2022/11/03.
//

import UIKit

class ListViewController: UITableViewController {
    // 출력한 배열 데이터
    var list = Array<UserVO>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var user = UserVO()
        user.firstName = "길동"
        user.lastName = "홍"
        user.street = "선릉역"
        user.mobile = "010-222-1234"
        user.picture = "01"
        self.list.append(user)
        
        
        user = UserVO()
        user.firstName = "우치"
        user.lastName = "전"
        user.street = "삼성역"
        user.mobile = "010-333-1234"
        user.picture = "02"
        self.list.append(user)
        
        
        user = UserVO()
        user.firstName = "문수"
        user.lastName = "박"
        user.street = "역삼역"
        user.mobile = "010-555-1234"
        user.picture = "03"
        self.list.append(user)
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
        cell.lastName?.text = row.lastName
        cell.firstName?.text = row.firstName
        cell.street?.text = row.street
        cell.cellPhone?.text = row.mobile
        
        // 이미지 출력
        cell.thumbnail.image = UIImage(named: row.picture!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("touch cell \(indexPath.row)")
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
