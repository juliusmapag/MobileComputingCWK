//
//  ViewController.swift
//  Cherry_Animation
//
//  Created by Xianhui Che on 25/08/2017.
//  Copyright © 2017 Xianhui Che. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var plane: UIImageView!
    
    @IBOutlet weak var cloud: UIImageView!
    
    @IBOutlet weak var road: UIImageView!
    
    @IBOutlet weak var tree: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            
        var cloudArray: [UIImage]!
            
        cloudArray = [UIImage(named: "cloud.png")!,
                      UIImage(named: "cloud2.png")!]

        cloud.image = UIImage.animatedImage(with: cloudArray, duration: 1)
        
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
                     UIImage(named: "tree10.png")!]
        
        tree.image = UIImage.animatedImage(with: treeArray, duration: 1)

            
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

