//
//  DetailViewController.swift
//  RankApp
//
//  Created by 김지호 on 2021/07/22.
//

import UIKit

class DetailViewController: UIViewController {

   
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    
    
    @IBAction func closeModal(_ sender: Any) {
        // 현재 모달창 끄기
        dismiss(animated: true, completion: nil)
    }
    
    var name : String?
    var bounty: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI()  {
        if let name = self.name , let bounty = self.bounty {
            let img = UIImage(named: name)
            imageView.image = img
            nameLabel.text = name
            bountyLabel.text = String(bounty)
        }
        
    }

   
     //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    

}
