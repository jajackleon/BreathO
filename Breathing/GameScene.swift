//
//  GameScene.swift
//  Breathing
//
//  Created by Jackie Leonardy on 28/04/21.
//

import SpriteKit

class BreathingScene: SKScene {
    
    weak var viewController: BreathingViewController?
    
    private var basePetal: SKSpriteNode = SKSpriteNode()
    
    private var star1: SKSpriteNode = SKSpriteNode()
    private var star2: SKSpriteNode = SKSpriteNode()
    private var star3: SKSpriteNode = SKSpriteNode()
    private var star4: SKSpriteNode = SKSpriteNode()
    private var star5: SKSpriteNode = SKSpriteNode()
    private var star6: SKSpriteNode = SKSpriteNode()
    
    private var starsFamily : [SKShapeNode??] = []

    
    private let starNormalWidth = 320.0
    private let timeInterval = 4.0
    
    override func didMove(to view: SKView) {
        let petalWidth : Float = 320
        let petalHeight : Float = 320
        
//        buildPetalDone(petalWidth: petalWidth, petalHeight: petalHeight)
        
        buildStar1(width: petalWidth, height: petalHeight, image: "Petal")
        buildStar2(width: petalWidth, height: petalHeight, image: "Petal")
        buildStar3(width: petalWidth, height: petalHeight, image: "Petal")
        buildStar4(width: petalWidth, height: petalHeight, image: "Petal")
        buildStar5(width: petalWidth, height: petalHeight, image: "Petal")
        buildStar6(width: petalWidth, height: petalHeight, image: "Petal")
//        buildBasePetal(width: petalWidth, height: petalHeight, image: "BasePetal")
        
        
        resizeAndRotate(widthQuantity: 0, angleQuantity: 0.1, duration: timeInterval, node: star1, xOffset: 0, yOffset: 2)
        resizeAndRotate(widthQuantity: 0, angleQuantity: 0.2, duration: timeInterval, node: star2, xOffset: 2.3, yOffset: 4.2)
        resizeAndRotate(widthQuantity: 0, angleQuantity: 0.3, duration: timeInterval, node: star3, xOffset: 2.3, yOffset: -4.2)
        resizeAndRotate(widthQuantity: 0, angleQuantity: 0.4, duration: timeInterval, node: star4, xOffset: 0, yOffset: -2)
        resizeAndRotate(widthQuantity: 0, angleQuantity: 0.5, duration: timeInterval, node: star5, xOffset: -2.3, yOffset: -4.2)
        resizeAndRotate(widthQuantity: 0, angleQuantity: 0.6, duration: timeInterval, node: star6, xOffset: -2.3, yOffset: 4.2)
        
        backgroundColor = UIColor.white
    }
    
    func buildBasePetal(width: Float, height: Float, image: String){
        let texture = SKTexture(imageNamed: image)
        basePetal = SKSpriteNode(texture: texture)
        basePetal.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        basePetal.position = CGPoint(x: frame.midX, y: frame.midY)
        basePetal.zPosition = 10
        
        addChild(basePetal)
    }
    
    func buildPetalDone(petalWidth : Float, petalHeight: Float){
        buildStarDone1(width: petalWidth, height: petalHeight)
        buildStarDone2(width: petalWidth, height: petalHeight)
        buildStarDone3(width: petalWidth, height: petalHeight)
        buildStarDone4(width: petalWidth, height: petalHeight)
        buildStarDone5(width: petalWidth, height: petalHeight)
        buildStarDone6(width: petalWidth, height: petalHeight)
        buildBasePetal(width: petalWidth, height: petalHeight, image: "BasePetal")
    }
    
    func buildStar1(width : Float, height : Float, image: String){
        let texture = SKTexture(imageNamed: image)
        star1 = SKSpriteNode(texture: texture)
//        star1.alpha = 0.25
        star1.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star1.position = CGPoint(x: frame.midX, y: frame.midY)
        star1.zPosition = 9
        
        addChild(star1)
    }
    
    func buildStar2(width: Float, height: Float, image: String){
        let texture = SKTexture(imageNamed: image)
        star2 = SKSpriteNode(texture: texture)
        
        star2.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star2.position = CGPoint(x: frame.midX, y: frame.midY)
        star2.zPosition = 8
        
        addChild(star2)
    }
    
    func buildStar3(width: Float, height: Float, image: String){
        let texture = SKTexture(imageNamed: image)
        star3 = SKSpriteNode(texture: texture)
        
        star3.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star3.position = CGPoint(x: frame.midX, y: frame.midY)
        star3.zPosition = 7
        
        addChild(star3)
    }
    
    func buildStar4(width: Float, height: Float, image: String){
        let texture = SKTexture(imageNamed: image)
        star4 = SKSpriteNode(texture: texture)
        
        star4.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star4.position = CGPoint(x: frame.midX, y: frame.midY)
        star4.zPosition = 6
            
        addChild(star4)
    }
    
    func buildStar5(width: Float, height: Float, image: String){
        let texture = SKTexture(imageNamed: image)
        star5 = SKSpriteNode(texture: texture)
        star5.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star5.position = CGPoint(x: frame.midX, y: frame.midY)
        star5.zPosition = 5
        
        addChild(star5)
    }
    
    func buildStar6(width: Float, height: Float, image: String){
        let texture = SKTexture(imageNamed: image)
        star6 = SKSpriteNode(texture: texture)
        
        star6.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star6.position = CGPoint(x: frame.midX, y: frame.midY)
        star6.zPosition = 4
        
        addChild(star6)
    }
    
    func buildStarDone1(width : Float, height : Float){
        let texture = SKTexture(imageNamed: "BasePetal")
        star1 = SKSpriteNode(texture: texture)
        star1.alpha = 0.25
        star1.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star1.position = CGPoint(x: frame.midX, y: frame.midY + CGFloat(height/2))
        star1.zPosition = 9
        
        addChild(star1)
    }
    
    func buildStarDone2(width: Float, height: Float){
        let texture = SKTexture(imageNamed: "BasePetal")
        star2 = SKSpriteNode(texture: texture)
        star2.alpha = 0.25
        star2.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star2.position = CGPoint(x: frame.midX + CGFloat(width/2.3), y: frame.midY + CGFloat(height/4.2))
        star2.zPosition = 8
        
        addChild(star2)
    }
    
    func buildStarDone3(width: Float, height: Float){
        let texture = SKTexture(imageNamed: "BasePetal")
        star3 = SKSpriteNode(texture: texture)
        star3.alpha = 0.25
        star3.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star3.position = CGPoint(x: frame.midX + CGFloat(width/2.3), y: frame.midY - CGFloat(height/4.2))
        star3.zPosition = 7
        
        addChild(star3)
    }
    
    func buildStarDone4(width: Float, height: Float){
        let texture = SKTexture(imageNamed: "BasePetal")
        star4 = SKSpriteNode(texture: texture)
        star4.alpha = 0.25
        star4.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star4.position = CGPoint(x: frame.midX, y: frame.midY - CGFloat(height/2))
        star4.zPosition = 6
            
        addChild(star4)
    }
    
    func buildStarDone5(width: Float, height: Float){
        let texture = SKTexture(imageNamed: "BasePetal")
        star5 = SKSpriteNode(texture: texture)
        star5.alpha = 0.25
        star5.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star5.position = CGPoint(x: frame.midX - CGFloat(width/2.3), y: frame.midY - CGFloat(height/4.2))
        star5.zPosition = 5
        
        addChild(star5)
    }
    
    func buildStarDone6(width: Float, height: Float){
        let texture = SKTexture(imageNamed: "BasePetal")
        star6 = SKSpriteNode(texture: texture)
        star6.alpha = 0.25
        star6.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star6.position = CGPoint(x: frame.midX - CGFloat(width/2.3), y: frame.midY + CGFloat(height/4.2))
        star6.zPosition = 4
        
        addChild(star6)
    }
    
//    func generateStar(with star : SKShapeNode, radius : Int){
//        var star = star
//        star = SKShapeNode(circleOfRadius: CGFloat(radius))
//        star.fillColor = UIColor(
//            red: 60/255.0,
//            green: 133/255.0,
//            blue: 223/255.0,
//            alpha: 0.25)
//        star.position = CGPoint(x: frame.midX, y: frame.midY)
//        star.strokeColor = UIColor()
//        star.zPosition = 1
//
//        addChild(star)
//    }
    
    func generateStar(with star : SKSpriteNode, radius : Int){
        var stars = star
        let texture = SKTexture(imageNamed: "BasePetal")
        stars = SKSpriteNode(texture: texture)
        stars.alpha = 0.25
        stars.size = CGSize(width: radius, height: radius)
        stars.position = CGPoint(x: frame.midX, y: frame.midY)
        
        addChild(stars)
    }
    func resizeAndRotate(widthQuantity: Double, angleQuantity: CGFloat, duration: Double, node: SKSpriteNode?, xOffset: Float, yOffset: Float){
        
            let resize = SKAction.resize(byWidth: CGFloat(starNormalWidth*widthQuantity), height: CGFloat(starNormalWidth*widthQuantity), duration: duration)
            let angle = SKAction.rotate(byAngle: -(.pi*angleQuantity), duration: duration)
        let positioning = SKAction.moveBy(x: xOffset == 0 ? 0 :  CGFloat(Float(starNormalWidth))/CGFloat(xOffset), y: CGFloat(Float(starNormalWidth))/CGFloat(yOffset), duration: duration)
            let firstAnimation = SKAction.group([resize,angle, positioning])
            
            let wait = SKAction.wait(forDuration: 2)
            
            let resize2 = SKAction.resize(byWidth: -(CGFloat(starNormalWidth*widthQuantity)), height: -(CGFloat(starNormalWidth*widthQuantity)), duration: duration+2)
            let angle2 = SKAction.rotate(byAngle: (.pi*angleQuantity), duration: duration+2)
        let positioning2 = SKAction.moveBy(x: xOffset == 0 ? 0 :  CGFloat(Float(starNormalWidth))/CGFloat(-xOffset), y:  CGFloat(Float(starNormalWidth))/CGFloat(-yOffset), duration: duration)
            let secondAnimation = SKAction.group([resize2,angle2, positioning2])
            
            let arrayAnimations = [firstAnimation, wait, secondAnimation]
            
            node?.run(SKAction.repeatForever(SKAction.sequence(arrayAnimations)), withKey: "breathingAnimation")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touched")
         removeAction(forKey: "breathingAnimation")
    }
    
}
