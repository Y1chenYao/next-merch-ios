//
//  SellerTableViewCell.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-05-04.
//

import UIKit

class SellerTableViewCell: UITableViewCell {
    
    let stackView = UIStackView()
    let merchLabel = UILabel()
    let descrView = UITextView()
    let quantityLabel = UILabel()
    let dateLabel = UILabel()
    let statusLabel01 = UILabel()
    let statusLabel02 = UILabel()
    let statusLabel03 = UILabel()
    let statusLabel04 = UILabel()
    let paymentButton = UIButton()
    let pickupButton = UIButton()
    var oid = -1
    
    //palatte
    let purple = UIColor(red: 0.44, green: 0.41, blue: 0.95, alpha: 1.00)
    let mildBlue = UIColor(red: 0.46, green: 0.56, blue: 0.97, alpha: 1.00)
    let serviceRed = UIColor(red: 0.97, green: 0.38, blue: 0.42, alpha: 1.00)
    let serviceGreen = UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00)
    
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
        
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.textColor = purple
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        quantityLabel.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descrView.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        descrView.translatesAutoresizingMaskIntoConstraints = false
        descrView.isScrollEnabled = false
        descrView.isEditable = false
        descrView.backgroundColor = .clear
        descrView.textContainer.lineFragmentPadding = 0
        descrView.textContainerInset = UIEdgeInsets.zero
        
        statusLabel01.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        statusLabel01.text = "Payment Status"
        statusLabel01.textColor = mildBlue
        statusLabel01.translatesAutoresizingMaskIntoConstraints = false
        
        statusLabel02.font = UIFont.systemFont(ofSize: 12)
        statusLabel02.translatesAutoresizingMaskIntoConstraints = false
        
        paymentButton.setTitle("Modify", for: .normal)
        paymentButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        paymentButton.setTitleColor(serviceRed, for: .normal)
        paymentButton.backgroundColor = .white
        paymentButton.layer.borderWidth = 1
        paymentButton.layer.borderColor = serviceRed.cgColor
        paymentButton.translatesAutoresizingMaskIntoConstraints = false
        paymentButton.layer.cornerRadius = 10
        paymentButton.addTarget(self, action: #selector(updatePayment), for: .touchUpInside)
        
        pickupButton.setTitle("Modify", for: .normal)
        pickupButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        pickupButton.setTitleColor(serviceRed, for: .normal)
        pickupButton.backgroundColor = .white
        pickupButton.layer.borderWidth = 1
        pickupButton.layer.borderColor = serviceRed.cgColor
        pickupButton.translatesAutoresizingMaskIntoConstraints = false
        pickupButton.layer.cornerRadius = 10
        pickupButton.addTarget(self, action: #selector(updatePickup), for: .touchUpInside)
        
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
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(quantityLabel)
        stackView.addArrangedSubview(descrView)
        
        stackView.addArrangedSubview(statusLabel01)
        stackView.addArrangedSubview(statusLabel02)
        stackView.addArrangedSubview(statusLabel03)
        stackView.addArrangedSubview(statusLabel04)
        
        contentView.addSubview(stackView)
        
        contentView.addSubview(paymentButton)
        contentView.addSubview(pickupButton)
    }
    
    @objc func updatePayment(){
        NetworkManager.shared.updateMerch(order_id: oid, picked_up: false, paid: true){order in
            DispatchQueue.main.async {
            }
        }
    }
    
    @objc func updatePickup(){
        NetworkManager.shared.updateMerch(order_id: oid, picked_up: true, paid: false){order in
            DispatchQueue.main.async {
            }
        }
    }
    
    
    func setupConstraints() {
        let verticalPadding: CGFloat = 15.0

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalPadding),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.heightAnchor.constraint(equalToConstant: 180),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            paymentButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            paymentButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -72),
            paymentButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            pickupButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            pickupButton.topAnchor.constraint(equalTo: paymentButton.bottomAnchor, constant: 8),
            pickupButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
    func configure(orderObject: Order) {
        quantityLabel.text = "Quantity: "+String(orderObject.num)
        descrView.text = "Venmo: "+orderObject.notes
        oid = orderObject.id
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
        
        NetworkManager.shared.getOneMerch(merch_id: orderObject.mid){ merch in
            DispatchQueue.main.async {
                self.merchLabel.text = merch.name + " Order #" + String(orderObject.id)
                self.dateLabel.text = merch.pickupTime + " @ " + merch.pickupPlace
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

