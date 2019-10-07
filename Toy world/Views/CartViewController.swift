//
//  CartViewController.swift
//  Toy world
//
//  Created by Yichuan Wang on 7/10/19.
//  Copyright © 2019 Wang Yichuan. All rights reserved.
//

import UIKit

class CartViewController: UITableViewController  {
    
   
  
    static var items:[Item] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartViewController.items.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        vc.item = items[indexPath.row]
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartViewCell
        cell.myImage.image = UIImage(named: CartViewController.items[indexPath.row].image)
        cell.myPrice.text = String(CartViewController.items[indexPath.row].price) + " / Month"
        cell.myTitle.text = CartViewController.items[indexPath.row].title
        
        return cell
    }
    
    //reload the data before the view is displayed
    override func viewWillAppear(_ animated: Bool) {
        refresh()
    }
    
    public func refresh(){
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }

}