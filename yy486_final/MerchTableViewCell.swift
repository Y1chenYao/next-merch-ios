//
//  MerchTableViewCell.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-04-30.
//

import UIKit

class MerchTableViewCell: UITableViewCell {
    
    var generalType = "nothing"
    let merchLabel = UILabel()
    let descrView = UITextView()
    let priceLabel = UILabel()
    let dateLabel = UILabel()
    let infoLabel = UILabel()
    let stackView = UIStackView()
    
    //palatte
    let purple = UIColor(red: 0.44, green: 0.41, blue: 0.95, alpha: 1.00)
    let mildBlue = UIColor(red: 0.46, green: 0.56, blue: 0.97, alpha: 1.00)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        // add shadow on cell
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .white
        
        // add corner radius on `contentView`
        contentView.layer.cornerRadius = 8
        
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
    }


    func setupViews() {
        merchLabel.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        merchLabel.textColor = purple
        merchLabel.numberOfLines = 0
        merchLabel.translatesAutoresizingMaskIntoConstraints = false

        descrView.font = UIFont.systemFont(ofSize: 12)
        descrView.translatesAutoresizingMaskIntoConstraints = false
        descrView.isScrollEnabled = false
        descrView.isEditable = false
        descrView.backgroundColor = .clear
        descrView.textContainer.lineFragmentPadding = 0;
        
        priceLabel.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        infoLabel.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        infoLabel.text = "Pickup Info"
        infoLabel.textColor = mildBlue
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical

        stackView.addArrangedSubview(merchLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(descrView)
        stackView.addArrangedSubview(infoLabel)
        stackView.addArrangedSubview(dateLabel)
        contentView.addSubview(stackView)
    }

    func setupConstraints() {
        let verticalPadding: CGFloat = 20.0

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalPadding),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.heightAnchor.constraint(equalToConstant: 160),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100)
        ])
    }

    func configure(merchObject: Merch) {
        merchLabel.text = merchObject.name
        let threshold = 140
        if(merchObject.description.count>threshold){
            descrView.text = String(merchObject.description.prefix(threshold))+" ..."
        }else{
            descrView.text = merchObject.description
        }
        priceLabel.text = "Price: "+String(merchObject.price)+"$"
        dateLabel.text = merchObject.pickupTime + " @ " + merchObject.pickupPlace
        generalType = merchObject.generalType
        
        //svg credit: Outdoors illustrations by Storyset
        //5 categories: food, clothing, show, concert, other(default)
        switch generalType {
        case "Food":
            let imageView = UIImageView(frame: CGRect(x: 240, y: 20, width: 170, height: 170))
            let image = UIImage(named: "svg1")
            imageView.image = image
            contentView.addSubview(imageView)
        case "Clothing":
            let imageView = UIImageView(frame: CGRect(x: 240, y: 20, width: 170, height: 170))
            let image = UIImage(named: "svg2")
            imageView.image = image
            contentView.addSubview(imageView)
        case "Show":
            let imageView = UIImageView(frame: CGRect(x: 240, y: 20, width: 170, height: 170))
            let image = UIImage(named: "svg3")
            imageView.image = image
            contentView.addSubview(imageView)
        case "Concert":
            let imageView = UIImageView(frame: CGRect(x: 230, y: 30, width: 250, height: 170))
            let image = UIImage(named: "svg4")
            imageView.image = image
            contentView.addSubview(imageView)
        default:
            let imageView = UIImageView(frame: CGRect(x: 225, y: 35, width: 210, height: 145))
            let image = UIImage(named: "svg5")
            imageView.image = image
            contentView.addSubview(imageView)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



