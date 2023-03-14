//
//  CustomCollectionViewCell.swift
//  Diffable Data Source
//
//  Created by MD. SHAYANUL HAQ SADI on 14/3/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let myImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "carrot.fill")
//        imageView.image = UIImage(named: "bg")
//        imageView.backgroundColor = .systemMint
        imageView.tintColor = .systemMint
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let Label = UILabel()
//        Label.text = "Fruit"
//        Label.backgroundColor = .green
        return Label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
        contentView.addSubview(myImage)
        contentView.addSubview(myLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //        myLabel.frame = contentView.bounds
        myLabel.frame = CGRect(x: 5, y: contentView.frame.size.height-50, width: contentView.frame.size.width-10, height: 50)
        //        myImage.frame = contentView.bounds
        myImage.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height-50)
    }
    
    
    func setup(label: String) {
        myLabel.text = label
    }
    
}
