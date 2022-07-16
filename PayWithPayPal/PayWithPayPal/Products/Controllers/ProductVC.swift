//
//  ProductVC.swift
//  PayWithPayPal
//
//  Created by Thanh Hoang on 16/07/2022.
//

import UIKit

class ProductVC: UIViewController {
    
    //MARK: - UIView
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    //MARK: - Properties
    lazy var products: [NSDictionary] = []
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getData()
    }
}

//MARK: - Setups

extension ProductVC {
    
    private func setupViews() {
        navigationItem.title = "Checkout"
        
        //TODO: - TableView
        tableView.frame = view.bounds
        tableView.backgroundColor = .white
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 140.0
        tableView.sectionHeaderHeight = 0.0
        tableView.sectionFooterHeight = 0.0
        tableView.separatorInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        tableView.register(ProductTVCell.self, forCellReuseIdentifier: ProductTVCell.id)
        tableView.register(CheckoutTVCell.self, forCellReuseIdentifier: CheckoutTVCell.id)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: - GetData

extension ProductVC {
    
    private func getData() {
        if let url = Bundle.main.url(forResource: "products.json", withExtension: nil),
           let data = try? Data(contentsOf: url),
           let json = try? JSONSerialization.jsonObject(with: data) as? NSDictionary
        {
            products = json["Products"] as? [NSDictionary] ?? []
            reloadData()
        }
    }
}

//MARK: - UITableViewDataSource

extension ProductVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? products.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductTVCell.id, for: indexPath) as! ProductTVCell
            let product = products[indexPath.row]
            
            cell.nameLbl.text = product["name"] as? String ?? ""
            cell.priceLbl.text = "$" + "\(product["price"] as? Double ?? 0.0)"
            cell.productImageView.image = UIImage(named: product["image"] as? String ?? "")
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CheckoutTVCell.id, for: indexPath) as! CheckoutTVCell
            cell.checkoutBtn.addTarget(self, action: #selector(paypalDidTap), for: .touchUpInside)
            return cell
        }
    }
    
    @objc private func paypalDidTap() {
        let total = products.map({ $0["price"] as? Double ?? 0.0 }).reduce(0, +)
        print("paypalDidTap: \(total)")
    }
}

//MARK: - UITableViewDelegate

extension ProductVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? tableView.rowHeight : 70.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .zero
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .zero
    }
}
