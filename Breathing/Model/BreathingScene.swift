//
//  GameScene.swift
//  Breathing
//
//  Created by Jackie Leonardy on 28/04/21.
//

import SpriteKit

class GameScene: SKScene {
    
    weak var viewController: GameViewController?
    
    private var basePetal: SKSpriteNode = SKSpriteNode()
    
    private var star1: SKSpriteNode = SKSpriteNode()
    private var star2: SKSpriteNode = SKSpriteNode()
    private var star3: SKSpriteNode = SKSpriteNode()
    private var star4: SKSpriteNode = SKSpriteNode()
    private var star5: SKSpriteNode = SKSpriteNode()
    private var star6: SKSpriteNode = SKSpriteNode()

    
    private let starNormalWidth = 300.0
    private let timeInterval = 4.0
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.white
    }
    
    func generatePetal(count: Int){
        MusicPlayer.fadeSound(ratioVolume: 0.5, transitionTime: 4)
        
        let petalWidth : Float = Float(starNormalWidth)
        let petalHeight : Float = Float(starNormalWidth)
        
        buildStar1(width: petalWidth, height: petalHeight, image: "Petal")
        buildStar2(width: petalWidth, height: petalHeight, image: "Petal")
        buildStar3(width: petalWidth, height: petalHeight, image: "Petal")
        buildStar4(width: petalWidth, height: petalHeight, image: "Petal")
        buildStar5(width: petalWidth, height: petalHeight, image: "Petal")
        buildStar6(width: petalWidth, height: petalHeight, image: "Petal")
        
        
        resizeAndRotate(widthQuantity: 0, angleQuantity: 0.1, duration: timeInterval, node: star1, xOffset: 0, yOffset: 2, count: count)
        resizeAndRotate(widthQuantity: 0, angleQuantity: 0.2, duration: timeInterval, node: star2, xOffset: 2.3, yOffset: 4.2, count: count)
        resizeAndRotate(widthQuantity: 0, angleQuantity: 0.3, duration: timeInterval, node: star3, xOffset: 2.3, yOffset: -4.2, count: count)
        resizeAndRotate(widthQuantity: 0, angleQuantity: 0.4, duration: timeInterval, node: star4, xOffset: 0, yOffset: -2, count: count)
        resizeAndRotate(widthQuantity: 0, angleQuantity: 0.5, duration: timeInterval, node: star5, xOffset: -2.3, yOffset: -4.2, count: count)
        resizeAndRotate(widthQuantity: 0, angleQuantity: 0.6, duration: timeInterval, node: star6, xOffset: -2.3, yOffset: 4.2, count: count)
        
    }
    
    func buildStar1(width : Float, height : Float, image: String){
        let texture = SKTexture(imageNamed: image)
        star1 = SKSpriteNode(texture: texture)
        star1.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star1.position = CGPoint(x: frame.midX, y: frame.midY)
        star1.zPosition = 9
        star1.alpha = 0
        
        addChild(star1)
    }
    
    func buildStar2(width: Float, height: Float, image: String){
        let texture = SKTexture(imageNamed: image)
        star2 = SKSpriteNode(texture: texture)
        
        star2.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star2.position = CGPoint(x: frame.midX, y: frame.midY)
        star2.zPosition = 8
        star2.alpha = 0
        
        addChild(star2)
    }
    
    func buildStar3(width: Float, height: Float, image: String){
        let texture = SKTexture(imageNamed: image)
        star3 = SKSpriteNode(texture: texture)
        
        star3.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star3.position = CGPoint(x: frame.midX, y: frame.midY)
        star3.zPosition = 7
        star3.alpha = 0
        
        addChild(star3)
    }
    
    func buildStar4(width: Float, height: Float, image: String){
        let texture = SKTexture(imageNamed: image)
        star4 = SKSpriteNode(texture: texture)
        
        star4.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star4.position = CGPoint(x: frame.midX, y: frame.midY)
        star4.zPosition = 6
        star4.alpha = 0
        
        addChild(star4)
    }
    
    func buildStar5(width: Float, height: Float, image: String){
        let texture = SKTexture(imageNamed: image)
        star5 = SKSpriteNode(texture: texture)
        star5.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star5.position = CGPoint(x: frame.midX, y: frame.midY)
        star5.zPosition = 5
        star5.alpha = 0
        
        addChild(star5)
    }
    
    func buildStar6(width: Float, height: Float, image: String){
        let texture = SKTexture(imageNamed: image)
        star6 = SKSpriteNode(texture: texture)
        
        star6.size = CGSize(width: CGFloat(width), height: CGFloat(height))
        star6.position = CGPoint(x: frame.midX, y: frame.midY)
        star6.zPosition = 4
        
        star6.alpha = 0
        addChild(star6)
    }
    
//    func generateStar(with star : SKShapeNode, radius : Int){
//        var star = star
//        star = SKShapeNode(circleOfRadius: CGFloat(radius))
//        star.fillColor = UIColor.babyBlueEyes
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
    func resizeAndRotate(widthQuantity: Double, angleQuantity: CGFloat, duration: Double, node: SKSpriteNode?, xOffset: Float, yOffset: Float, count: Int){
        
        let fadeInAnimation = SKAction.fadeIn(withDuration: 0.5)
        node?.run(fadeInAnimation)
        
            let resize = SKAction.resize(byWidth: CGFloat(starNormalWidth*widthQuantity), height: CGFloat(starNormalWidth*widthQuantity), duration: 4)
            let angle = SKAction.rotate(byAngle: -(.pi*angleQuantity), duration: 4)
            let positioning = SKAction.moveBy(x: xOffset == 0 ? 0 :  CGFloat(Float(starNormalWidth))/CGFloat(xOffset), y: CGFloat(Float(starNormalWidth))/CGFloat(yOffset), duration: 4)
           
//            let circle = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 150, height: 150), cornerRadius: 150)
//            let followCircle = SKAction.follow(circle.cgPath, asOffset: true, orientToPath: false, duration: 5.0)
//            let data = CAShapeLayer()
//            data.path = circle.cgPath
//            data.fillColor = UIColor.orange.cgColor
//
//            view?.layer.addSublayer(data)
        
        let firstAnimation = SKAction.group([resize,angle, positioning])
//        self.viewController?.setTimer(second: 10)
        let wait = SKAction.wait(forDuration: 7)
        
            let resize2 = SKAction.resize(byWidth: -(CGFloat(starNormalWidth*widthQuantity)), height: -(CGFloat(starNormalWidth*widthQuantity)), duration: 8)
            let angle2 = SKAction.rotate(byAngle: (.pi*angleQuantity), duration: 8)
            let positioning2 = SKAction.moveBy(x: xOffset == 0 ? 0 :  CGFloat(Float(starNormalWidth))/CGFloat(-xOffset), y:  CGFloat(Float(starNormalWidth))/CGFloat(-yOffset), duration: 8)
        
        let secondAnimation = SKAction.group([resize2,angle2, positioning2])
        
            let arrayAnimations = [firstAnimation, wait, secondAnimation]
        
            let animationPlaySequence = SKAction.repeat(SKAction.sequence(arrayAnimations), count: count)
            
        
            let fadeOffAnimation = SKAction.fadeOut(withDuration: 2)
            let removeAnimation = SKAction.removeFromParent()
        
        let animationSequences = [animationPlaySequence, fadeOffAnimation, removeAnimation]
            
        node?.run(SKAction.sequence(animationSequences), completion: {
            self.viewController?.breathingButton.isUserInteractionEnabled = true
            MusicPlayer.fadeSound(ratioVolume: 2, transitionTime: 4)
        })
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
}
