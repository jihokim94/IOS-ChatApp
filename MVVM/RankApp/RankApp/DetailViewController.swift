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
    
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
    let viewModel = DetailViewModel()
    
    @IBAction func closeModal(_ sender: Any) {
        // 현재 모달창 끄기
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation() // 화면에서 숨기기
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        performAnimation()
    }
    
    private func prepareAnimation() {
        //수평 축을 view의 바운즈 위쓰만큼 줘서 화면에서 안보이게 만든다
        // 오토레이아웃을 이용한 애니메이션
        //        nameLabelCenterX.constant = view.bounds.width
        //        bountyLabelCenterX.constant = view.bounds.width
        
        // 속성을 이용한 애니메이션
        //transform view content에 변형을 가한다.
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180) // 미리 사진의 크기를 3배씩 늘려놓고 180도 뒤집어 놓음
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180) // 미리 사진의 크기를 3배씩 늘려놓고 180도 뒤집어 놓음
        
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
    }
    
    //    //constraints를 이용한 animation
    //    private func performAnimation() {
    //        //애니메이션 동작시 원래 자리로 컨스턴트 주기
    //        nameLabelCenterX.constant = 0
    //        bountyLabelCenterX.constant = 0
    //
    //        // 레이블 스프링 형태로~
    //        UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
    //            self.view.layoutIfNeeded()
    //            // 레이아웃을 다시해야할 필요가 있다면 해라~ Lays out the subviews immediately, if layout updates are pending.
    //        }, completion: nil)
    //        // 이미지 플립하기
    //        UIView.transition(with: imageView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    //
    //    }
    
    //view 속성을 이용한 애니메이션
    private func performAnimation() {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            // 위와 같은 방식으로 밑에 내용을 애니메이션 해줌
            self.nameLabel.transform = CGAffineTransform.identity // 원해 속성으로 돌려줌
            self.nameLabel.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            // 위와 같은 방식으로 밑에 내용을 애니메이션 해줌
            self.bountyLabel.transform = CGAffineTransform.identity
            self.bountyLabel.alpha = 1
        }, completion: nil)
        UIView.transition(with: imageView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil
        )
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
// animation 이란 = 시작 , 끝 , 시간 3가지 이 요소들을 이용해 쉽게 구현해보자~
// 시간에 따라 뷰의 상태가 바뀌는것~ 동적인 UI효과

class DetailViewModel {
    var bountyInfo : BountyInfo?
    
    func update(model : BountyInfo?)  {
        bountyInfo = model
    }
}
