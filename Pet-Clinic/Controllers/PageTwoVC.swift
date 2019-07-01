//
//  PageTwoVC.swift
//  Pet-Clinic
//
//  Created by Achem Samuel on 6/25/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//


import UIKit

class PageTwoVC : SuperViewController {
    
    
    @IBOutlet weak var requiredLabel: UILabel!
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    var isOn = Bool()
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        //print(isOn ) //Always return false
        if toggleSwitch.isOn {
            label2.isHidden = false
            textBox.isHidden = false
            requiredLabel.isHidden = true
            //toggleSwitch.setOn(true, animated: true)
        } else {
            label2.isHidden = true
            textBox.isHidden = true
            requiredLabel.isHidden = false
        }
    }
    
    
    var textFieldArray : [UITextField] = []
    
    override func viewDidLoad() {
        setUpView()
    }
    
    func setUpView () {
        label2.isHidden = true
        textBox.isHidden = true
        textFieldArray = [textBox]
        setupToolBar(textFieldArray: textFieldArray)
        
        parseJson.getPetJsonData { (response) in
            headLabel.text = response.pages?[1].sections?[0].label
            infoLabel.text = response.pages?[1].sections?[0].elements?[0].label
            label2.text = response.pages?[1].sections?[0].elements?[1].label
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        PageThreeVC.pg2S = toggleSwitch.isOn
    }
    
    
    
}
