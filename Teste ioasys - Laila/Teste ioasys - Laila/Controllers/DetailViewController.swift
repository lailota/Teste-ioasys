//
//  DetailViewController.swift
//  Teste ioasys - Laila
//
//  Created by Laila Guzzon Hussein Lailota on 27/06/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabelDetail: UILabel!
    @IBOutlet weak var textViewDetail: UITextView!
    
    var name: String?
    var enterpriseDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = false
        
        navigationItem.title = name?.uppercased()
        nameLabelDetail.text = name?.uppercased()
        textViewDetail.text = enterpriseDescription
        // Do any additional setup after loading the view.
        
    }
    

}
