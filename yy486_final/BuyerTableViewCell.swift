//
//  BuyerTableViewCell.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-05-04.
//

import UIKit

class BuyerTableViewCell: UITableViewCell {
    
    var generalType = "nothing"
    let stackView = UIStackView()
    let merchLabel = UILabel()
    let descrView = UITextView()
    let priceLabel = UILabel()
    let dateLabel = UILabel()
    let infoLabel = UILabel()
    let statusLabel01 = UILabel()
    let statusLabel02 = UILabel()
    let statusLabel03 = UILabel()
    let statusLabel04 = UILabel()
    let deleteButton = UIButton()
    
    //palatte
    let purple = UIColor(red: 0.44, green: 0.41, blue: 0.95, alpha: 1.00)
    let mildBlue = UIColor(red: 0.46, green: 0.56, blue: 0.97, alpha: 1.00)
    let serviceGreen = UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00)
    let serviceRed = UIColor(red: 0.97, green: 0.38, blue: 0.42, alpha: 1.00)
    
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
        descrView.textContainer.lineFragmentPadding = 0
        descrView.textContainerInset = UIEdgeInsets.zero
        
        priceLabel.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        infoLabel.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        infoLabel.text = "Pickup Info"
        infoLabel.textColor = mildBlue
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        statusLabel01.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        statusLabel01.text = "Payment Status"
        statusLabel01.textColor = mildBlue
        statusLabel01.translatesAutoresizingMaskIntoConstraints = false
        
        statusLabel02.font = UIFont.systemFont(ofSize: 12)
        statusLabel02.translatesAutoresizingMaskIntoConstraints = false
        
        statusLabel03.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        statusLabel03.text = "Pickup Status"
        statusLabel03.textColor = mildBlue
        statusLabel03.translatesAutoresizingMaskIntoConstraints = false
        
        statusLabel04.font = UIFont.systemFont(ofSize: 12)
        statusLabel04.translatesAutoresizingMaskIntoConstraints = false
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(merchLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(descrView)
        stackView.addArrangedSubview(infoLabel)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(statusLabel01)
        stackView.addArrangedSubview(statusLabel02)
        stackView.addArrangedSubview(statusLabel03)
        stackView.addArrangedSubview(statusLabel04)
        
        deleteButton.setTitle("Cancel", for: .normal)
        deleteButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        deleteButton.setTitleColor(serviceRed, for: .normal)
        deleteButton.backgroundColor = .white
        deleteButton.layer.borderWidth = 1
        deleteButton.layer.borderColor = serviceRed.cgColor
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.layer.cornerRadius = 10
        deleteButton.addTarget(self, action: #selector(deleteOrder), for: .touchUpInside)
        
        contentView.addSubview(stackView)
        contentView.addSubview(deleteButton)
    }
    
    func setupConstraints() {
        let verticalPadding: CGFloat = 20.0

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalPadding),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.heightAnchor.constraint(equalToConstant: 220),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100)
        ])
        
        NSLayoutConstraint.activate([
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            deleteButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -42),
            deleteButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func deleteOrder(){
        print("delete order not implemented")
    }
    
    func configure(orderObject: Order) {
        priceLabel.text = "Quantity: "+String(orderObject.num)
        if(orderObject.paid){
            statusLabel02.text = "Verified ✅"
            statusLabel02.textColor = serviceGreen
        }else{
            statusLabel02.text = "Pending ⌛"
            statusLabel02.textColor = serviceRed
        }
        
        if(orderObject.pickedUp){
            statusLabel04.text = "Picked up ✅"
            statusLabel04.textColor = serviceGreen
        }else{
            statusLabel04.text = "To be picked up ⌛"
            statusLabel04.textColor = serviceRed
        }

        
        //TODO: add get request here by mid
        let merchObject = Merch(id:1, sid: 1, name: "Matcha Cookie", generalType: "Food", description: "Matcha Cookies are soft and chewy sugar cookies with a beautiful bright matcha green tea flavor.", price: 3, pickupTime: "Apr30 1-5pm", pickupPlace: "Upson Hall")
        
        
        //render order with merch info
        if let idx = orderObject.id {
            merchLabel.text = merchObject.name + " Order #" + String(idx)
        }else{
            merchLabel.text = merchObject.name + " Order #undefined"
        }
        let threshold = 140
        if(merchObject.description.count>threshold){
            descrView.text = String(merchObject.description.prefix(threshold))+" ..."
        }else{
            descrView.text = merchObject.description
        }
        dateLabel.text = merchObject.pickupTime + " @ " + merchObject.pickupPlace
        generalType = merchObject.generalType
        
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
        case "Ticket":
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
