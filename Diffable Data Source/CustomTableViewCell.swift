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
//        imageView.image = UIImage(systemName: "carrot.fill")
//        imageView.image = UIImage(named: "bg")
//        imageView.backgroundColor = .systemRed
        imageView.tintColor = .systemMint
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
//        label.text = "Fruit"
//        label.backgroundColor = .green
//        label.textColor = .systemMint
//        label.backgroundColor = .separator
        label.textColor = .lightText
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        return label
        
    }()
            
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.backgroundColor = .clear
//        contentView.backgroundColor = .systemBlue
        contentView.addSubview(myImage)
        contentView.addSubview(myLabel)
        backgroundView = UIImageView(image: UIImage(named: "bg 4"))
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(x: 20, y: 0, width: contentView.frame.size.width-120, height: contentView.frame.size.height)
        myImage.frame = CGRect(x: contentView.frame.size.width-100, y: 10, width: 80, height: 80)
    }


//    func setup(label: String) {
//        myLabel.text = label
//    }
    
    func setup(fruit: ViewController.Fruit) {
        myLabel.text = fruit.title
        myImage.image = fruit.image
    }
    
    
}
