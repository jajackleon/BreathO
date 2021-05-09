//
//  StoryCollectionViewCell.swift
//  Breathing
//
//  Created by Jackie Leonardy on 30/04/21.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: StoryCollectionViewCell.self)
    
    @IBOutlet weak var bigTitle : UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var secondaryTitle: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(_ slide: StorySlide){
        bigTitle.text = slide.title
        image.image = slide.image
        secondaryTitle.text = slide.subTitle
        descriptionLabel.attributedText = slide.description
    }
}
