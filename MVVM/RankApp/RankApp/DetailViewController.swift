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
    
    let viewModel = DetailViewModel()
    
    @IBAction func closeModal(_ sender: Any) {
        // 현재 모달창 끄기
        dismiss(animated: true, completion: nil)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI()  {
        if let bountyInfo = self.viewModel.bountyInfo {
            let img = UIImage(named: bountyInfo.name)
            imageView.image = img
            nameLabel.text = bountyInfo.name
            bountyLabel.text = String(bountyInfo.bounty)
        }
    }

}

class DetailViewModel {
    var bountyInfo : BountyInfo?
    
    func update(model : BountyInfo?)  {
       bountyInfo = model
    }
}
