//
//  CustomTableViewCell.swift
//  Diffable Data Source
//
//  Created by MD. SHAYANUL HAQ SADI on 15/3/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
        
    static let identifier = "CustomTableViewCell"
    
    
    private let myImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "carrot.fill")
//        imageView.image = UIImage(named: "bg")
//        imageView.backgroundColor = .systemRed
        imageView.tintColor = .systemMint
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let Label = UILabel()
//                Label.text = "Fruit"
//                Label.backgroundColor = .green
        return Label
        
    }()
            
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBlue
        contentView.addSubview(myImage)
        contentView.addSubview(myLabel)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(x: 10, y: 0, width: 200, height: contentView.frame.size.height)
//        myImage.frame = CGRect(x: 10 + myLabel.frame.size.width, y: 0, width: 100, height: 100)
        myImage.frame = CGRect(x: contentView.frame.size.width-100, y: 0, width: 100, height: 100)
        
//
//        //        myLabel.frame = contentView.bounds
//        myLabel.frame = CGRect(x: 5, y: contentView.frame.size.height-50, width: contentView.frame.size.width-10, height: 50)
//        //        myImage.frame = contentView.bounds
//        myImage.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height-50)
    }


    func setup(label: String) {
        myLabel.text = label
    }
    
    
    
    
    
    
    
    
//
//
//    static let identifier = "CustomTableViewCell"
//
//    private let myImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "carrot.fill")
////        imageView.image = UIImage(named: "bg")
////        imageView.backgroundColor = .systemMint
//        imageView.tintColor = .systemMint
//        return imageView
//    }()
//
//    private let myLabel: UILabel = {
//        let Label = UILabel()
////        Label.text = "Fruit"
////        Label.backgroundColor = .green
//        return Label
//    }()
//
////    override init(frame: CGRect) {
////        super.init(frame: frame)
////        contentView.backgroundColor = .systemBlue
////        contentView.addSubview(myImage)
////        contentView.addSubview(myLabel)
////    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        //        myLabel.frame = contentView.bounds
//        myLabel.frame = CGRect(x: 5, y: contentView.frame.size.height-50, width: contentView.frame.size.width-10, height: 50)
//        //        myImage.frame = contentView.bounds
//        myImage.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height-50)
//    }
//
//
//    func setup(label: String) {
//        myLabel.text = label
//    }
//
    
    
}
