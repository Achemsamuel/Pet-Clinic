//
//  PageThreeVC.swift
//  Pet-Clinic
//
//  Created by Achem Samuel on 6/25/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//

import UIKit

class PageThreeVC : SuperViewController {
    
    let buttonMethod = ButtonMethods()
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var textBox1: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    /*
     Page Elements For Validation
     pg = page
     T = textBox
     E = element
     S = switch
 */
    static var pg1T1 = String()
    static var pg1T2 = String()
    static var pg1T3 = String()
    static var pg1T4 = String()
    static var pg2S = Bool()
    var validationKey = Bool()
    
    
    override func viewDidLoad() {
        setUpView()
        
        
    }
    
    @IBAction func submitButtonClicked(_ sender: UIButton) {
        validate()
        
    }
    
    func setUpView () {
        buttonMethod.setUpButton(button: submitButton)
        parseJson.getPetJsonData { (response) in
            headLabel.text = response.pages?[2].sections?[0].label
            infoLabel.text = response.pages?[2].sections?[0].elements?[0].label
            label1.text = response.pages?[2].sections?[0].elements?[1].label
        }
        
    }
    
    
    func validate () {
        parseJson.getPetJsonData { (response) in
            self.validationKey = validateInputFields(result: response)
            print(validationKey)
            
            if validationKey {
                successfulAlert(title: "Successful", msg: "Thank you for submitting an application, we will get back to you shortly")
            }
        }
      
    }
    
    
    func validateInputFields (result : Pet) -> Bool {
        
        if (result.pages?[0].sections?[1].elements?[0].isMandatory)! && PageThreeVC.pg1T1.isEmpty {
            print("Some fields are required on Page One")
            alert(title: "Missing Fields", msg: "Some fields are required on Page One", page: "Go To Page One", segueID: pageOneSegue, VC: PageThreeVC.self)
            
            return false
        }
        if (result.pages?[0].sections?[1].elements?[1].isMandatory)! && PageThreeVC.pg1T2.isEmpty {
            print("Some fields are required on Page One")
            alert(title: "Missing Fields", msg: "Some fields are required on Page One", page: "Go To Page One", segueID: pageOneSegue, VC: PageThreeVC.self)
            return false
        }
        if (result.pages?[0].sections?[1].elements?[2].isMandatory)! && PageThreeVC.pg1T3.isEmpty {
            print("Some fields are required on Page One")
           alert(title: "Missing Fields", msg: "Some fields are required on Page One", page: "Go To Page One", segueID: pageOneSegue, VC: PageThreeVC.self)
            return false
        }
        if (result.pages?[0].sections?[1].elements?[3].isMandatory)! && PageThreeVC.pg1T4.isEmpty {
            print("Some fields are required on Page One")
           alert(title: "Missing Fields", msg: "Some fields are required on Page One", page: "Go To Page One", segueID: pageOneSegue, VC: PageThreeVC.self)
            return false
        }
        if (result.pages?[1].sections?[0].elements?[0].isMandatory)! && (PageThreeVC.pg2S.self == false) {
            print("Swich : \(PageThreeVC.pg2S)")
            print("Some fields are required on Page Two")
            alert(title: "Missing Fields", msg: "Some fields are required on Page Two", page: "Go To Page Two", segueID: pageTwoSegue, VC: PageThreeVC.self)
            return false
        }
        if (result.pages?[2].sections?[0].elements?[1].isMandatory)! && textBox1.text!.isEmpty {
            print("Please fill in the required fields on this page")
            secondaryAlert(title: "Missing Fields", msg: "Some fields are required")
            return false
        }
        
        return true
    }
    
    
}
