//
//  MerchTableViewCell.swift
//  yy486_final
//
//  Created by AshtonBlade on 2023-04-30.
//

import UIKit

class MerchTableViewCell: UITableViewCell {

    let merchLabel = UILabel()
    let descrView = UITextView()
    let priceLabel = UILabel()
    let dateLabel = UILabel()
    let infoLabel = UILabel()

    let stackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        merchLabel.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        merchLabel.numberOfLines = 0
        merchLabel.translatesAutoresizingMaskIntoConstraints = false

        descrView.font = UIFont.systemFont(ofSize: 12)
        descrView.translatesAutoresizingMaskIntoConstraints = false
        descrView.isScrollEnabled = false
        descrView.isEditable = false
        descrView.textContainer.lineFragmentPadding = 0;
        
        priceLabel.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        infoLabel.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        infoLabel.text = "Pickup Info"
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
//            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func configure(merchObject: Merch) {
        merchLabel.text = merchObject.name
        descrView.text = merchObject.description
        priceLabel.text = "Price: "+String(merchObject.price)+"$"
        dateLabel.text = merchObject.pickupTime + " @ " + merchObject.pickupPlace
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



