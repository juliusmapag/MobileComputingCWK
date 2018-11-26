//
//  DraggedImageView.swift
//  Dragging_Image
//
//  Created by Xianhui Che on 26/05/2016.
//  Copyright © 2016 Xianhui Che. All rights reserved.
//

import UIKit

class planedrag: UIImageView {
    
    var startLocation: CGPoint?
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        startLocation = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let currentLocation = touches.first?.location(in: self)
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        
        self.center = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
    }
    
    
    
    
}

