//
//  BountyInfo.swift
//  RankApp
//
//  Created by 김지호 on 2021/07/22.
//

import Foundation
import UIKit

struct BountyInfo {
    let name : String
    let bounty : Int
    
    var image:UIImage? {
        return UIImage(named: name)
    }
    
    init(name: String , bounty : Int) {
        self.name = name
        self.bounty = bounty
    }
}
