//
//  CollectionViewCell.swift
//  Finance Calculator
//
//  Created by Kirishikesan on 2023-08-22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var marksLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    var url : String = ""

    
    @IBAction func viewButtonClicked(_ sender: UIButton) {
        if let link = URL(string: self.url){
            print(url)
            UIApplication.shared.open(link)
        }
    }
    
    func configure(with learningMaterial: LearningMaterial){
        let boldAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: yearLabel.font.pointSize)
        ]
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .font: yearLabel.font // Use the same font as the label's default font
        ]
        
        let yearLabelText = "Year - \(learningMaterial.year)"
        let marksLabelText = "Marks - \(learningMaterial.marks)%"
        let dateLabelText = "Date - \(learningMaterial.date)"
        let durationLabelText = "Duration - \(learningMaterial.duration) Hours"
        
        let yearAttributedString = NSMutableAttributedString(string: yearLabelText, attributes: boldAttributes)
        let marksAttributedString = NSMutableAttributedString(string: marksLabelText, attributes: boldAttributes)
        let dateAttributedString = NSMutableAttributedString(string: dateLabelText, attributes: boldAttributes)
        let durationAttributedString = NSMutableAttributedString(string: durationLabelText, attributes: boldAttributes)
        
        yearAttributedString.addAttributes(normalAttributes, range: NSRange(location: 6, length: yearLabelText.count - 6))
        marksAttributedString.addAttributes(normalAttributes, range: NSRange(location: 7, length: marksLabelText.count - 7))
        dateAttributedString.addAttributes(normalAttributes, range: NSRange(location: 6, length: dateLabelText.count - 6))
        durationAttributedString.addAttributes(normalAttributes, range: NSRange(location: 10, length: durationLabelText.count - 10))
        
        yearLabel.attributedText = yearAttributedString
        marksLabel.attributedText = marksAttributedString
        dateLabel.attributedText = dateAttributedString
        durationLabel.attributedText = durationAttributedString
        
        url = learningMaterial.url
    }

}

