//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Denizalp KAPISIZ on 13/07/16.
//  Copyright © 2016 Denizalp KAPISIZ. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK : Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    let size = 40
    
    // MARK : Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<starCount {
            
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
            
        }
    }
    
    override func layoutSubviews() {
        
        let buttonSize = size
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for (index,button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize+spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = size
        let width = (buttonSize * starCount) + (spacing * (starCount-1))
        return CGSize(width: width, height: buttonSize)
    }
    
    // MARK : Button Action
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates(){
        
        for (index,button) in ratingButtons.enumerate() {
            button.selected = index < rating
        }
    }
    
}