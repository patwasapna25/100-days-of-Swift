//
//  RowSolt.swift
//  MilestoneProject-Day66
//
//  Created by Sapna Patwa on 10/05/24.
//

import UIKit
import SpriteKit

class RowSolt: SKNode {
    
    func configure(at position: CGPoint) {
        self.position = position
        createTarget()
        
    }
    
    func createTarget() {
        let target = SKSpriteNode(imageNamed: "target0")
        target.position = CGPoint(x: 550, y: 0)
        addChild(target)
        target.run(SKAction.moveTo(x: -300, duration: 5))
        
    }
}
