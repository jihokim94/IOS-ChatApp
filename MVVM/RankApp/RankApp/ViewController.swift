//
//  ViewController.swift
//  RankApp
//
//  Created by 김지호 on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    let nameList = ["brook" ,"chopper" , "franky" , "luffy" , "nami", "robin", "sanji" ,"zoro"]
    let bountyList = [33000000 , 50, 44000000 , 3000000000 , 16000000 , 80000000,77000000,120000000 ]
    
    // perform segue에 보낼 것들을 담아 놓자
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //DetailViewController에 필요한 데이터 보내줄거야!
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
                if let index = sender as? Int { // sender가 int indexpath.row를 보내줄 예정
                    vc?.name = nameList[index]
                    vc?.bounty = bountyList[index]
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController : UITableViewDataSource {
    //섹션당 들어가야할 로우 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    // cell 지정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else { return UITableViewCell()}
        
        cell.imgView.image = UIImage(named: nameList[indexPath.row])
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = String(bountyList[indexPath.row])
        
        return cell
    }
    
    // 섹션의 개수
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
}


extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        // 여기서 센더는 prepare에서의 센더와 같다
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        
        
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var bountyLabel : UILabel!
}
