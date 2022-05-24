//
//  TableOneViewCell.swift
//  ArkusTest
//
//  Created by Mauricio Zarate on 22/05/22.
//

import UIKit

class TableOneViewCell: UITableViewCell {
    
    static let identifier = "TableOneViewCell"
    public var titulo: String?

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpConstraints()
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    let photoImg:UIImageView = {
    let img = UIImageView()
        img.contentMode = .scaleAspectFit
    img.translatesAutoresizingMaskIntoConstraints = false
    img.layer.cornerRadius = 10
    img.clipsToBounds = true
    return img
    }()
    
    
    let nameLabel:UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textColor = UIColor(named: "titleColor")
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
    
    let adddressLabel1:UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 12)
    label.textColor = UIColor(named: "addressColor")
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
    
    let adddressLabel2:UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textColor = UIColor(named: "addressColor")
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
    
    let distancelbl:UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 12)
    label.textColor = UIColor(named: "titleColor")
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
    
    let petImg:UIImageView = {
    let img = UIImageView()
        img.contentMode = .scaleAspectFit
    img.translatesAutoresizingMaskIntoConstraints = false
    img.layer.cornerRadius = 10
    img.clipsToBounds = true
    return img
    }()
    
    let petlbl:UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 12)
    label.textColor = UIColor(named: "titleColor")
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
    func setUpConstraints() {
        
        contentView.addSubview(photoImg)
        contentView.addSubview(nameLabel)
        contentView.addSubview(adddressLabel1)
        contentView.addSubview(adddressLabel2)
        contentView.addSubview(distancelbl)
        contentView.addSubview(petImg)
        contentView.addSubview(petlbl)

        
        photoImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        photoImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        photoImg.widthAnchor.constraint(equalToConstant: 95).isActive = true
        photoImg.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: photoImg.trailingAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        adddressLabel1.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        adddressLabel1.leadingAnchor.constraint(equalTo: photoImg.trailingAnchor, constant: 10).isActive = true
        adddressLabel1.widthAnchor.constraint(equalToConstant: 120).isActive = true
        adddressLabel1.heightAnchor.constraint(equalToConstant: 50).isActive = true
      
        adddressLabel2.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 18).isActive = true
        adddressLabel2.leadingAnchor.constraint(equalTo: photoImg.trailingAnchor, constant: 10).isActive = true
        adddressLabel2.widthAnchor.constraint(equalToConstant: 120).isActive = true
        adddressLabel2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        distancelbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -5).isActive = true
        distancelbl.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50).isActive = true
        distancelbl.widthAnchor.constraint(equalToConstant: 40).isActive = true
        distancelbl.heightAnchor.constraint(equalToConstant: 50).isActive = true
      
        petImg.topAnchor.constraint(equalTo: distancelbl.topAnchor, constant: 40).isActive = true
        petImg.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -55).isActive = true
        petImg.widthAnchor.constraint(equalToConstant: 30).isActive = true
        petImg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        petlbl.topAnchor.constraint(equalTo: petImg.topAnchor, constant: 30).isActive = true
        petlbl.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80).isActive = true
        petlbl.widthAnchor.constraint(equalToConstant: 90).isActive = true
        petlbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    }
}
