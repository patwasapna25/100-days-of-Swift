//
//  GameScene.swift
//  MilestoneProject-Day66
//
//  Created by Sapna Patwa on 10/05/24.
//


/**
 a shooting gallery game using SpriteKit: create three rows on the screen, then have targets slide across from one side to the other. If the user taps a target, make it fade out and award them points.
 */


import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let targets = ["target0", "target1", "target2", "target3"]
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var targetTimer: Timer?
    var gameTimer: Timer?
    var scoreLabel: SKLabelNode!
    var bulletsLabel: SKLabelNode!
    var reloadLabel: SKLabelNode!
    var timerLabel: SKLabelNode!
    var targetSpeed = 4.0
    var isGameOver = false
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    var bullets = 6 {
        didSet {
            bulletsLabel.text = "Pins: \(bullets)"
        }
    }
    
    var timeLeft = 60 {
        didSet {
            timerLabel.text = "Time left: \(timeLeft)"
        }
    }
    
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.position = CGPoint(x: 16, y: 30)
        scoreLabel.horizontalAlignmentMode = .left
        addChild(scoreLabel)
        
        bulletsLabel = SKLabelNode(fontNamed: "Chalkduster")
        bulletsLabel.position = CGPoint(x: 860, y: 30)
        bulletsLabel.horizontalAlignmentMode = .left
        addChild(bulletsLabel)
        
        reloadLabel = SKLabelNode(fontNamed: "Chalkduster")
        reloadLabel.position = CGPoint(x: 512, y: 680)
        reloadLabel.text = "Reload"
        reloadLabel.name = "reload"
        addChild(reloadLabel)
        
        timerLabel = SKLabelNode(fontNamed: "Chalkduster")
        timerLabel.position = CGPoint(x: 500, y: 30)
        addChild(timerLabel)
        
        score = 0
        bullets = 6
        timeLeft = 60
        
        targetTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(createTarget), userInfo: nil, repeats: true)
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func createTarget() {
        let level = Int.random(in: 0...2)
        let targetIndex = Int.random(in: 0...3)
        let target = SKSpriteNode(imageNamed: targets[targetIndex])
        target.name = targetIndex == 3 ? "bad" : "good"
        
        var moveRight = false
        
        switch level {
        case 0:
            target.position = CGPoint(x: 1200, y: 240)
            target.xScale = -target.xScale // flip the target horizontally so it faces the direction of travel
            break
        case 1:
            target.position = CGPoint(x: -100, y: 400)
            moveRight = true
            break
        case 2:
            target.position = CGPoint(x: 1200, y: 560)
            target.xScale = -target.xScale
        default:
            break
        }
        
        target.run(SKAction.moveTo(x: moveRight ? 1200 : -200, duration: targetSpeed))
        addChild(target)
        
        levelUp()
    }
    
    @objc func updateTimer() {
        timeLeft -= 1
        
        if timeLeft == 0 {
            isGameOver = true
            gameTimer?.invalidate()
            targetTimer?.invalidate()
            
            let gameOver = SKSpriteNode(imageNamed: "game-over")
            gameOver.position = CGPoint(x: 512, y: 368)
            gameOver.zPosition = 1
            addChild(gameOver)
        }
    }
    
    func levelUp() {
        targetSpeed *= 0.99
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        if bullets > 0 {
            bullets -= 1
            run(SKAction.playSoundFileNamed("shot.wav", waitForCompletion: false))
        } else {
            run(SKAction.playSoundFileNamed("empty.wav", waitForCompletion: false))
        }
        
        let location = touch.location(in: self)
        let tappedNode = nodes(at: location)
        
        for node in tappedNode {
            if bullets > 0, node.name == "good" || node.name == "bad" {
                targetHit(node)
            } else if bullets <= 0, node.name == "reload" {
                bullets = 6
                run(SKAction.playSoundFileNamed("reload.wav", waitForCompletion: false))
            }
        }
    }
    
    func targetHit(_ target: SKNode) {
        score = target.name == "good" ? score + 1 : score - 1
        target.run(SKAction.fadeOut(withDuration: 0.2))
    }
    
    override func update(_ currentTime: TimeInterval) {
        for node in children {
            if node.position.x <= -200 || node.position.x >= 1300 {
                node.removeFromParent()
            }
        }
    }
}
