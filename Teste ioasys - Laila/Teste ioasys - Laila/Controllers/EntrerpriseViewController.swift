//
//  EntrerpriseViewController.swift
//  Teste ioasys - Laila
//
//  Created by Laila Guzzon Hussein Lailota on 25/06/21.
//

import UIKit
import Foundation

class MyCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellLabel: UILabel!
    
}

class EntrerpriseViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var api = LoginApiModel()
    
    var model: EnterpriseApiModel = {
        return EnterpriseApiModel.enterprise
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.tableFooterView = UIView()
        
        
        myTableView.delegate = self
        myTableView.dataSource = self
        searchBar.delegate = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension EntrerpriseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if model.filteredEnterprises.isEmpty {
            resultsLabel.text = "\(model.enterprises.count) resultados encontrados"
            return model.enterprises.count
        } else {
            resultsLabel.text = "\(model.filteredEnterprises.count) resultados encontrados"
            return model.filteredEnterprises.count
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyCell? = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? MyCell
        
            cell?.cellLabel.text = model.enterprises[indexPath.row].enterpriseName.uppercased()
            cell?.cellView.backgroundColor = model.enterprises[indexPath.row].cellColor

        return cell ?? UITableViewCell()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DetailViewController {
            destinationVC.name = model.enterprises[(myTableView.indexPathForSelectedRow?.row)!].enterpriseName
            destinationVC.enterpriseDescription = model.enterprises[(myTableView.indexPathForSelectedRow?.row)!].enterpriseDescription
            myTableView.deselectRow(at: myTableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailViewController", sender: self)
    }
    
}


// MARK: - Search bar methods

extension EntrerpriseViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        model.filteredEnterprises = []

        if searchText.isEmpty {
            model.filteredEnterprises = model.enterprises
            
        } else {
            for value in model.enterprises {
                if value.enterpriseName.uppercased().contains(searchText.uppercased()) {
                    model.filteredEnterprises.append(value)
                }
            }
        }
        self.myTableView.reloadData()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
    


