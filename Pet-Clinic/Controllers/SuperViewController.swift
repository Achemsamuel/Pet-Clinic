//
//  ViewController.swift
//  Pet-Clinic
//
//  Created by Achem Samuel on 6/25/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit
import ChameleonFramework

class SuperViewController: UIViewController {

    let parseJson = Parsejson()
    
    /* Segue Identifiers */
    let pageOneSegue = "goToPageOne"
    let pageTwoSegue = "goToPageTwo"
    let pageThreeSegue = "goToPageThree"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJson.getPetJsonData { (response) in
            for item in response.pages! {
                print(item)
            }
        }
    }
    
    func callJson () {
        parseJson.getPetJsonData { (response) in
            for item in response.pages! {
                print(item)
            }
        }
    }
    
    
    @objc func dismisskey () {
        view.endEditing(true)
    }
    
    func setupToolBar (textFieldArray : [UITextField]) {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barStyle = .blackTranslucent
        toolbar.barTintColor = .white
        toolbar.tintColor = .green
        toolbar.backgroundColor = .lightGray
        
        let finishButton = UIBarButtonItem(title: "Finish", style: .done, target: self, action: #selector(dismisskey))
        
        toolbar.setItems([finishButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        for textField in textFieldArray {
            textField.inputAccessoryView = toolbar
        }
    }
    
    
    func alert (title: String, msg: String, page: String, segueID : String, VC : Any?) {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "\(page)", style: .destructive, handler: { (action) in
         self.performSegue(withIdentifier: segueID, sender: VC.self)
        }))
        self.present(alert, animated: true)
    }
    
    func secondaryAlert (title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Continue Editing", style: .destructive, handler: nil))
        
         self.present(alert, animated: true)
    }
    
    func successfulAlert (title: String, msg: String) {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }


}

