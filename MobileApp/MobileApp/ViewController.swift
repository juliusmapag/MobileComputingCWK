//
//  ViewController.swift
//  Cherry_Animation
//
//  Created by Xianhui Che on 25/08/2017.
//  Copyright © 2017 Xianhui Che. All rights reserved.
//
import UIKit
import AVFoundation

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
    
    @IBOutlet weak var replayButton: UIButton!
    @IBAction func replayButton(_ sender: Any) {
        clearAll()
        self.viewDidLoad()
        self.gameover.alpha = 0
        score = 0
        
    }
    
    
    
    var dynamicAnimator: UIDynamicAnimator!
    var dynamicItemBehavior: UIDynamicItemBehavior!
    var collisionBehavior: UICollisionBehavior!
    
    var coinArray = [0,2,4,6,8,10,12,14,16,18]
    var birdArray = [1,3,5,7,9,11,13,15,17,19]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MusicHelper.sharedHelper.playBackgroundMusic()
        
        
        gameover.frame = CGRect(x: 0, y: 0, width: W*(1), height: H*(1))
        
        
        plane.delegate = self
        
        //UIItemBehaviour
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicItemBehavior = UIDynamicItemBehavior(items: [])
        collisionBehavior = UICollisionBehavior (items: []);
        collisionBehavior.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: plane.frame))
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        dynamicAnimator.addBehavior(collisionBehavior)
        
        
        
        //coin animation with collision and dissapear when collided with plane
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
                self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: -250, y:0), for: coin)
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
        
        
      
        
  
      
        //Bird animation
        for index in 0...9{
            let delay = Double(self.birdArray[index])
            let release = DispatchTime.now() + delay
            DispatchQueue.main.asyncAfter(deadline: release){
                let bird = UIImageView(image: nil)
                var birdImageArray: [UIImage]
                
                birdImageArray = [UIImage(named: "alien1.png")!,
                                  UIImage(named: "alien2.png")!,
                                  UIImage(named: "alien3.png")!,
                                  UIImage(named: "alien3.png")!,
                                  UIImage(named: "alien5.png")!,]
                                
                
                bird.image = UIImage.animatedImage(with: birdImageArray, duration: 0.5)
                bird.frame = CGRect(x: self.W, y: CGFloat (arc4random_uniform(UInt32(self.H)-50)), width: self.W*(0.2), height:self.H*(0.2))
                
                self.view.addSubview(bird)
                self.view.bringSubviewToFront(bird)
                
                self.dynamicItemBehavior.addItem(bird)
                self.dynamicItemBehavior.addLinearVelocity(CGPoint(x: -300, y:0), for: bird)
                self.collisionBehavior.addItem(bird)
                
                self.score -= (50)
                
            }
        }
        
        
     
        //Plane
        var planeArray: [UIImage]!
        
        planeArray = [UIImage(named: "jet1.png")!,
                      UIImage(named: "jet2.png")!,
                      UIImage(named: "jet3.png")!,
                      UIImage(named: "jet4.png")!,
                      UIImage(named: "jet5.png")!,
                      UIImage(named: "jet6.png")!,
                      UIImage(named: "jet7.png")!,
                      UIImage(named: "jet8.png")!,
                      UIImage(named: "jet9.png")!,
                      UIImage(named: "jet10.png")!,
                      UIImage(named: "jet11.png")!,
                      UIImage(named: "jet12.png")!,
                      UIImage(named: "jet13.png")!,
                      UIImage(named: "jet14.png")!,
                      UIImage(named: "jet15.png")!,
                      UIImage(named: "jet16.png")!,
                      UIImage(named: "jet17.png")!]
        
        plane.image = UIImage.animatedImage(with: planeArray, duration: 1)
        plane.frame = CGRect(x: 0, y: H*(0.2), width: W*(0.4), height: H*(0.2))
        
       

        
        
        
    
//        var cloudArray: [UIImage]!
//
//        cloudArray = [UIImage(named: "cloud.png")!,
//                      UIImage(named: "cloud2.png")!]
//
//        cloud.image = UIImage.animatedImage(with: cloudArray, duration: 1)
//        cloud.frame = CGRect(x: 0, y: 0, width: W*1, height: H * (0.5))
        //
        
       

        //Sky background, name not changed from Road as this took too much renaming
        var roadArray: [UIImage]!
        
        roadArray = [UIImage(named: "sky25.png")!,
                      UIImage(named: "sky24.png")!,
                      UIImage(named: "sky23.png")!,
                      UIImage(named: "sky22.png")!,
                      UIImage(named: "sky21.png")!,
                      UIImage(named: "sky20.png")!,
                      UIImage(named: "sky19.png")!,
                      UIImage(named: "sky18.png")!,
                      UIImage(named: "sky17.png")!,
                      UIImage(named: "sky16.png")!,
                      UIImage(named: "sky15.png")!,
                      UIImage(named: "sky14.png")!,
                      UIImage(named: "sky13.png")!,
                      UIImage(named: "sky12.png")!,
                      UIImage(named: "sky11.png")!,
                      UIImage(named: "sky10.png")!,
                      UIImage(named: "sky9.png")!,
                      UIImage(named: "sky8.png")!,
                      UIImage(named: "sky7.png")!,
                      UIImage(named: "sky6.png")!,
                      UIImage(named: "sky5.png")!,
                      UIImage(named: "sky4.png")!,
                      UIImage(named: "sky3.png")!,
                      UIImage(named: "sky2.png")!]
        
        road.image = UIImage.animatedImage(with: roadArray, duration: 4)
        road.frame = CGRect (x:0, y:0, width: W*1, height: H*1)
        
      
       
        
        
       
        //timer for the gameoverscreen to appear after 20seconds
        let timer = DispatchTime.now() + 19
        DispatchQueue.main.asyncAfter(deadline: timer) {
            self.gameover.alpha = 1
        
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}

func clearAll() {

    for (anotherview) in self.view.subviews
    {
        if ((self.plane != anotherview) && (self.road != anotherview) && (self.gameover != anotherview))
        {
            anotherview.removeFromSuperview()
        }
    }
}
}
