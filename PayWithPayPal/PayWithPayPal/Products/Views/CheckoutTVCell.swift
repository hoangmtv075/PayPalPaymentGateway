//
//  CheckoutTVCell.swift
//  PayWithPayPal
//
//  Created by Thanh Hoang on 16/07/2022.
//

import UIKit

class CheckoutTVCell: UITableViewCell {
    
    //MARK: - Properties
    static let id = "CheckoutTVCell"
    
    let checkoutBtn = UIButton()
    
    //MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

//MARK: - Configures

extension CheckoutTVCell {
    
    func configureCell() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
        
        //TODO: - CheckoutBtn
        checkoutBtn.clipsToBounds = true
        checkoutBtn.setImage(UIImage(named: "icon-paypal"), for: .normal)
        checkoutBtn.contentMode = .scaleAspectFit
        checkoutBtn.backgroundColor = UIColor(red: 255/255, green: 196/255, blue: 57/255, alpha: 1.0)
        checkoutBtn.layer.cornerRadius = 8.0
        contentView.addSubview(checkoutBtn)
        checkoutBtn.translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: - NSLayoutConstraint
        NSLayoutConstraint.activate([
            checkoutBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            checkoutBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
            checkoutBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0),
            checkoutBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.0)
        ])
    }
}

