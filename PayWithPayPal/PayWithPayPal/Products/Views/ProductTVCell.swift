//
//  ProductTVCell.swift
//  PayWithPayPal
//
//  Created by Thanh Hoang on 16/07/2022.
//

import UIKit

class ProductTVCell: UITableViewCell {
    
    //MARK: - Properties
    static let id = "ProductTVCell"
    
    let nameLbl = UILabel()
    let priceLbl = UILabel()
    let productImageView = UIImageView()
    
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

extension ProductTVCell {
    
    func configureCell() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        let selectedView = UIView(frame: .zero)
        selectedView.backgroundColor = .black.withAlphaComponent(0.1)
        selectedBackgroundView = selectedView
        
        //TODO: - NameLbl
        nameLbl.font = UIFont.systemFont(ofSize: 20.0, weight: .semibold)
        nameLbl.textColor = .darkGray
        
        //TODO: - PriceLbl
        priceLbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        priceLbl.textColor = .black
        
        //TODO: - ProductImageView
        productImageView.clipsToBounds = true
        productImageView.contentMode = .scaleAspectFill
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        
        //TODO: - UIStackView
        let nameSV = createStackView(spacing: 10.0, distribution: .fill, axis: .vertical, alignment: .leading)
        nameSV.addArrangedSubview(nameLbl)
        nameSV.addArrangedSubview(priceLbl)
        
        //TODO: - UIStackView
        let stackView = createStackView(spacing: 10.0, distribution: .fill, axis: .horizontal, alignment: .center)
        stackView.addArrangedSubview(productImageView)
        stackView.addArrangedSubview(nameSV)
        contentView.addSubview(stackView)
        
        //TODO: - NSLayoutConstraint
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -20.0),
        ])
    }
    
    private func createStackView(spacing: CGFloat, distribution: UIStackView.Distribution, axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment) -> UIStackView {
        let sv = UIStackView()
        sv.spacing = spacing
        sv.distribution = distribution
        sv.axis = axis
        sv.alignment = alignment
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }
}
