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
    
    var enterpriseList = [Enterprise]()
    var enterpriseListFiltered = [Enterprise]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.tableFooterView = UIView()
        
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.reloadData()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension EntrerpriseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model.searchResults {

            resultsLabel.text = "\(model.filteredEnterprises.count) resultados encontrados"
            return model.filteredEnterprises.count
        } else {
            resultsLabel.text = "\(model.enterprises.count) resultados encontrados"
            return model.enterprises.count
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyCell? = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? MyCell
        
        if model.searchResults && model.enterpriseTotal != 0 {
            cell?.cellLabel.text = model.filteredEnterprises[indexPath.row].enterpriseName.uppercased()
            cell?.cellView.backgroundColor = model.filteredEnterprises[indexPath.row].cellColor
        } else {
            cell?.cellLabel.text = model.enterprises[indexPath.row].enterpriseName.uppercased()
            cell?.cellView.backgroundColor = model.enterprises[indexPath.row].cellColor
        }
        
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


    


