//
//  ViewController.swift
//  RankApp
//
//  Created by 김지호 on 2021/07/21.
//


/*
 
 //MVVM
 
 -Model
 bountyInfo 만들자
 
 -View
 
 ListCell ( imgView , nameLabel , bountyLabel)
 view들은 viewModel을 통해서 구성되기 ?
 
 ListCell 필요한 정보를 ViewModel한테서 받아야겠다.
 ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트 하기
 
 -ViewModel
 DetailViewModel
 BountyViewModel
 뷰레이어에서 필요한 메소드 만들기
 모델 가지고 있기 ,, BountyInfo 들...
 
 */

//MARK: -Tableview Version


//import UIKit
//
//class ViewController: UIViewController {
//
//    let viewModel =  BountyViewModel()
//
//
//    // perform segue에 보낼 것들을 담아 놓자
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //DetailViewController에 필요한 데이터 보내줄거야!
//        if segue.identifier == "showDetail" {
//            let vc = segue.destination as? DetailViewController
//            if let index = sender as? Int { // sender가 int indexpath.row를 보내줄 예정
//
//                let bountyInfo = viewModel.bountyInfo(at: index)
//                vc?.viewModel.update(model: bountyInfo) // bountyInfo 전달
//            }
//        }
//
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//}
//
//extension ViewController : UITableViewDataSource {
//    //섹션당 들어가야할 로우 개수
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.numberOfBountyInfoList
//    }
//
//    // cell 지정
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else { return UITableViewCell()}
//
//        // 리스트안 객체 하나씩 뽑기
//        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
//        cell.updateInfo(info: bountyInfo)
//        //아래와 같음
//        //        cell.imgView.image = UIImage(named: bountyInfo.name)
//        //        cell.nameLabel.text = bountyInfo.name
//        //        cell.bountyLabel.text = String(bountyInfo.bounty)
//
//
//        return cell
//    }
//
//    // 섹션의 개수
//    func numberOfSections(in tableView: UITableView) -> Int{
//        return 1
//    }
//
//}
//
//
//extension ViewController : UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(indexPath.row)")
//        // 여기서 센더는 prepare에서의 센더와 같다
//        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
//
//    }
//}
//
//
//class ListCell: UITableViewCell {
//    @IBOutlet weak var imgView : UIImageView!
//    @IBOutlet weak var nameLabel : UILabel!
//    @IBOutlet weak var bountyLabel : UILabel!
//
//    func updateInfo(info :BountyInfo)  {
//        imgView.image = UIImage(named: info.name)
//        nameLabel.text = info.name
//        bountyLabel.text = String(info.bounty)
//    }
//}
//
//
//class BountyViewModel{
//    let boundtyInfoList : [BountyInfo] = [
//        BountyInfo(name: "brook", bounty: 33000000),
//        BountyInfo(name: "chopper", bounty: 50),
//        BountyInfo(name: "franky", bounty: 44000000),
//        BountyInfo(name: "luffy", bounty: 3000000000),
//        BountyInfo(name: "nami", bounty: 16000000),
//        BountyInfo(name: "robin", bounty: 80000000),
//        BountyInfo(name: "sanji", bounty: 77000000),
//        BountyInfo(name: "zoro", bounty: 120000000)
//    ]
//    var sortedList : [BountyInfo] {
//        // 바운티 크기에따라 배열 정렬
//        let sortedList = boundtyInfoList.sorted { lhs, rhs in
//            return lhs.bounty > rhs.bounty
//        }
//        return sortedList
//    }
//    var numberOfBountyInfoList : Int {
//        return boundtyInfoList.count
//    }
//
//    // 인덱스를 주면 바운티 인스턴스 리턴
//    func bountyInfo(at index : Int) -> BountyInfo  {
//        return sortedList[index]
//    }
//
//}



//MARK: -CollectionView Version


import UIKit

class BountyViewController: UIViewController {
   
    let viewModel =  BountyViewModel()
    
    // perform segue에 보낼 것들을 담아 놓자
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //DetailViewController에 필요한 데이터 보내줄거야!
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int { // sender가 int indexpath.row를 보내줄 예정
                
                let bountyInfo = viewModel.bountyInfo(at: index)
                vc?.viewModel.update(model: bountyInfo) // bountyInfo 전달
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
        
    }
}

// 몇개를 보여줄까 ?
// 셀은 어떻게 표현 할건지 ?
extension BountyViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfBountyInfoList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            print("asd1123123123")
            return UICollectionViewCell()
        }
        print("cell update")
        let bountyInfo = viewModel.bountyInfo(at: indexPath.item)
        cell.updateInfo(info:bountyInfo)
        
        return cell
    }
}

//셀이 어떻게 반응 할지~~~~~
extension BountyViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("---> \(indexPath.item)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
}
// cell size를 계산 할거여  일관적인 디자인을 보여줄라고
extension BountyViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing : CGFloat = 10.0
        let textAreaHeight : CGFloat = 65.0
        
        let width : CGFloat = (collectionView.bounds.width - itemSpacing) / 2
        let height : CGFloat = width * 10/7 + textAreaHeight // 7:10 비율로 보여줄 예정
        
        return CGSize(width: width, height: height)
    }
}


//class ListCell: UITableViewCell {
//    @IBOutlet weak var imgView : UIImageView!
//    @IBOutlet weak var nameLabel : UILabel!
//    @IBOutlet weak var bountyLabel : UILabel!
//
//    func updateInfo(info :BountyInfo)  {
//        imgView.image = UIImage(named: info.name)
//        nameLabel.text = info.name
//        bountyLabel.text = String(info.bounty)
//    }
//}

class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func updateInfo(info :BountyInfo)  {
        imgView.image = UIImage(named: info.name)
        nameLabel.text = info.name
        bountyLabel.text = String(info.bounty)
    }
}


class BountyViewModel{
    let boundtyInfoList : [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 3000000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    var sortedList : [BountyInfo] {
        // 바운티 크기에따라 배열 정렬
        let sortedList = boundtyInfoList.sorted { lhs, rhs in
            return lhs.bounty > rhs.bounty
        }
        return sortedList
    }
    var numberOfBountyInfoList : Int {
        return boundtyInfoList.count
    }
    // 인덱스를 주면 바운티 인스턴스 리턴
    func bountyInfo(at index : Int) -> BountyInfo  {
        return sortedList[index]
    }
}
