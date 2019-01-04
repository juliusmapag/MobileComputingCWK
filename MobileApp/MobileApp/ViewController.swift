//
//  ViewController.swift
//  Cherry_Animation
//
//  Created by Xianhui Che on 25/08/2017.
//  Copyright © 2017 Xianhui Che. All rights reserved.
//
import UIKit

protocol subviewDelegate {
    func changeSomething()
}

class ViewController: UIViewController, subviewDelegate {
    func changeSomething() {
        collisionBehavior.removeAllBoundaries()
        collisionBehavior.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: plane.frame))
        
        scorelabel.text = "score:\(score)"
    }
    
    var score = 0
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    
   
    @IBOutlet weak var plane: planedrag!
    
    @IBOutlet weak var coins: UIImageView!
    
    @IBOutlet weak var cloud: UIImageView!
    
    @IBOutlet weak var road: UIImageView!
    
    @IBOutlet weak var tree: UIImageView!
    
    @IBOutlet weak var crows: UIImageView!
    
    @IBOutlet weak var crows1: UIImageView!
    
    @IBOutlet weak var crows2: UIImageView!
    
    @IBOutlet weak var gameover: UIView!
    
    @IBOutlet weak var scorelabel: UILabel!
    
    @IBOutlet weak var replayscreenfit: UIButton!
    
    @IBAction func replay(_ sender: Any) {
        self.viewDidLoad()
        
        gameover.isHidden = true
        crows1.isHidden = true
        crows.isHidden = true
        crows2.isHidden = true
        score = 0
    }
    
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    var collisionBehavior: UICollisionBehavior!
    
    let coinArray = [0,2,4,6,8,10,12,14,16,18]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameover.frame = CGRect(x: 0, y: 0, width: W*(1), height: H*(1))
        replayscreenfit.frame = CGRect(x: 0, y: 0, width: W*(1), height: H*(1))
        
        plane.delegate = self
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicItemBehavior = UIDynamicItemBehavior(items: [crows, crows1, crows2])
        collisionBehavior = UICollisionBehavior (items: [crows, crows1, crows2]);
        collisionBehavior.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: plane.frame))
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        dynamicAnimator.addBehavior(collisionBehavior)
        
        //animation of coins
        
        for index in 0...9{
            let delay = Double(self.coinArray[index])
            let release = DispatchTime.now() + delay
            DispatchQueue.main.asyncAfter(deadline: release){
                let coin = UIImageView(image: nil)
                var coinArray: [UIImage]
                
                coinArray = [UIImage(named: "coin.png")!]
                
                coin.image = UIImage.animatedImage(with: coinArray, duration: 0.5)
                coin.frame = CGRect(x: self.W, y: CGFloat (arc4random_uniform(UInt32(self.H)-50)), width: self.W*(0.1), height:self.H*(0.1))
                
                self.view.addSubview(coin)
                self.view.bringSubviewToFront(coin)
                
                self.dynamicItemBehavior.addItem(coin)
                self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: -100, y:0), for: coin)
                self.collisionBehavior.addItem(coin)
                
                self.score += (100)
                
                self.collisionBehavior.action =
                    {
                        if coin.frame.intersects(self.plane.frame)
                        {
                            coin.removeFromSuperview()
                        }
                }
            }
        }
        
        

        //crows
        var crowsArray: [UIImage]!
        
        crowsArray = [UIImage(named: "bird1.png")!,
                      UIImage(named:  "bird2.png")!,
                      UIImage(named:  "bird3.png")!,
                      UIImage(named:  "bird4.png")!,
                      UIImage(named:  "bird5.png")!,
                      UIImage(named:  "bird6.png")!,
                      UIImage(named:  "bird7.png")!,
                      UIImage(named:  "bird8.png")!,
                      UIImage(named:  "bird9.png")!,
                      UIImage(named:  "bird10.png")!]
        
        crows.image = UIImage.animatedImage(with: crowsArray, duration: 1)
        
        crows.frame = CGRect(x:400, y: 100, width: 120, height: 60)
        self.view.addSubview(crows)
        
        self.dynamicItemBehavior.addItem(crows)
        self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: -300, y: 0), for: crows)
        self.collisionBehavior.addItem(crows)
        //
        
       
        
        //crows1
        var crows1Array: [UIImage]!
        
        crows1Array = [UIImage(named: "bird1.png")!,
                      UIImage(named:  "bird2.png")!,
                      UIImage(named:  "bird3.png")!,
                      UIImage(named:  "bird4.png")!,
                      UIImage(named:  "bird5.png")!,
                      UIImage(named:  "bird6.png")!,
                      UIImage(named:  "bird7.png")!,
                      UIImage(named:  "bird8.png")!,
                      UIImage(named:  "bird9.png")!,
                      UIImage(named:  "bird10.png")!]
        
        crows1.image = UIImage.animatedImage(with: crows1Array, duration: 1)
        
        crows1.frame = CGRect(x:400, y: 100, width: 100, height: 40)
        self.view.addSubview(crows1)
        
        var bird = DispatchTime.now() + 8
        DispatchQueue.main.asyncAfter(deadline: bird) {
            self.dynamicItemBehavior.addItem(self.crows1)
            self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: -300, y: 0), for: self.crows1)
            self.collisionBehavior.addItem(self.crows1)
        }
        //
        
        //crows2
        var crows2Array: [UIImage]!
        
        crows2Array = [UIImage(named: "bird1.png")!,
                      UIImage(named:  "bird2.png")!,
                      UIImage(named:  "bird3.png")!,
                      UIImage(named:  "bird4.png")!,
                      UIImage(named:  "bird5.png")!,
                      UIImage(named:  "bird6.png")!,
                      UIImage(named:  "bird7.png")!,
                      UIImage(named:  "bird8.png")!,
                      UIImage(named:  "bird9.png")!,
                      UIImage(named:  "bird10.png")!]
        
        crows2.image = UIImage.animatedImage(with: crows2Array, duration: 1)
        
        crows2.frame = CGRect(x:400, y: 100, width: 100, height: 40)
        self.view.addSubview(crows2)
        
        bird = DispatchTime.now() + 12
        DispatchQueue.main.asyncAfter(deadline: bird) {
            self.dynamicItemBehavior.addItem(self.crows2)
            self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: -200, y: 0), for: self.crows2)
            self.collisionBehavior.addItem(self.crows2)
        }
        //
        
        
        
        var planeArray: [UIImage]!
        
        planeArray = [UIImage(named: "plane1.png")!,
                      UIImage(named: "plane2.png")!,
                      UIImage(named: "plane3.png")!,
                      UIImage(named: "plane4.png")!,
                      UIImage(named: "plane5.png")!,
                      UIImage(named: "plane6.png")!,
                      UIImage(named: "plane7.png")!,
                      UIImage(named: "plane8.png")!,
                      UIImage(named: "plane9.png")!,
                      UIImage(named: "plane10.png")!,
                      UIImage(named: "plane11.png")!,
                      UIImage(named: "plane12.png")!,
                      UIImage(named: "plane13.png")!,
                      UIImage(named: "plane14.png")!,
                      UIImage(named: "plane15.png")!]
        
        plane.image = UIImage.animatedImage(with: planeArray, duration: 1)
        plane.frame = CGRect(x: 0, y: H*(0.2), width: W*(0.2), height: H*(0.125))
        
        
    
        var cloudArray: [UIImage]!
            
        cloudArray = [UIImage(named: "cloud.png")!,
                      UIImage(named: "cloud2.png")!]

        cloud.image = UIImage.animatedImage(with: cloudArray, duration: 1)
        cloud.frame = CGRect(x: 0, y: 0, width: W*1, height: H * (0.5))
        //
    
        //
        var roadArray: [UIImage]!
        
        roadArray = [UIImage(named: "road1.png")!,
                      UIImage(named: "road2.png")!,
                      UIImage(named: "road3.png")!,
                      UIImage(named: "road4.png")!,
                      UIImage(named: "road5.png")!,
                      UIImage(named: "road6.png")!,
                      UIImage(named: "road7.png")!,
                      UIImage(named: "road8.png")!,
                      UIImage(named: "road9.png")!,
                      UIImage(named: "road10.png")!,
                      UIImage(named: "road11.png")!,
                      UIImage(named: "road12.png")!,
                      UIImage(named: "road13.png")!,
                      UIImage(named: "road14.png")!,
                      UIImage(named: "road15.png")!,
                      UIImage(named: "road16.png")!,
                      UIImage(named: "road17.png")!,
                      UIImage(named: "road18.png")!,
                      UIImage(named: "road19.png")!]
        
        road.image = UIImage.animatedImage(with: roadArray, duration: 1)
        road.frame = CGRect (x:0, y:0, width: W*1, height: H*1)
        
        var treeArray: [UIImage]!
        
        treeArray = [UIImage(named: "tree1.png")!,
                     UIImage(named: "tree2.png")!,
                     UIImage(named: "tree3.png")!,
                     UIImage(named: "tree4.png")!,
                     UIImage(named: "tree5.png")!,
                     UIImage(named: "tree6.png")!,
                     UIImage(named: "tree7.png")!,
                     UIImage(named: "tree8.png")!,
                     UIImage(named: "tree9.png")!,
                     UIImage(named: "tree10.png")!,
                     UIImage(named: "tree11.png")!,
                     UIImage(named: "tree12.png")!,
                     UIImage(named: "tree13.png")!,
                     UIImage(named: "tree14.png")!,
                     UIImage(named: "tree15.png")!,
                     UIImage(named: "tree16.png")!,
                     UIImage(named: "tree17.png")!]
        
        
        tree.image = UIImage.animatedImage(with: treeArray, duration: 1)
        tree.frame = CGRect(x: 0, y: 0, width: W*1, height: H*(0.78))
    
        
        let timer = DispatchTime.now() + 10
        DispatchQueue.main.asyncAfter(deadline: timer) {
            self.gameover.alpha = 1
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}
