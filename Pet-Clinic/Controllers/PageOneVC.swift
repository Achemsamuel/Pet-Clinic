//
//  PageOneVC.swift
//  Pet-Clinic
//
//  Created by Achem Samuel on 6/25/19.
//  Copyright © 2019 Achem Samuel. All rights reserved.
//


import UIKit
import Kingfisher
import ChameleonFramework

class PageOneVC : SuperViewController {
    
    let imageViewSetUp = ImageViewSetUp()
    /*-------------------------------
     Mark: IBOutlets
     -------------------------------*/
    
    @IBOutlet weak var imageLoadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var textBox1: UITextField!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var textBox2: UITextField!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var textBox3: UITextField!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var textBox4: UITextField!
    var datePicker : UIDatePicker?
    var dateTextField = UITextField()
    
    var textFieldArray : [UITextField] = []
    
    override func viewDidLoad() {
        super.callJson()
        scrollView.delegate = self
        textFieldSetUp()
        setUpViewElements()
    }
    
    func textFieldSetUp () {
        textFieldArray = [textBox1, textBox2, textBox3, textBox4]
        setupToolBar(textFieldArray: textFieldArray)
    }
    
    func setUpViewElements () {
        
        imageViewSetUp.customImageView(imageView: petImageView)
        parseJson.getPetJsonData { (response) in
            //Pet Image Set Up
            let petImageUrl = response.pages?[0].sections?[0].elements?[0].file
            print(petImageUrl!)
            petImageView.kf.setImage(with: URL(string: petImageUrl!), placeholder: UIImage(named: "Pet Image"), options: [.transition(.flipFromLeft(0.5)), .cacheOriginalImage, .memoryCacheExpiration(.days(1))])
                self.imageLoadingIndicator.isHidden = true
            
            
            let eleNum = response.pages?[0].sections?[1].elements?.count
            
            for each in 0 ..< eleNum! {
                let type = response.pages?[0].sections?[1].elements?[each].type
                //print("TYpe::: \(type!)")
                changeInputType(type: type!, index: each, textFieldArray: textFieldArray)
            }
            
            pageLabel.text = response.name
            welcomeLabel.text = response.pages?[0].sections?[0].label
            infoLabel.text = response.pages?[0].sections?[1].label
            label1.text = response.pages?[0].sections?[1].elements?[0].label
            label2.text = response.pages?[0].sections?[1].elements?[1].label
            label3.text = response.pages?[0].sections?[1].elements?[2].label
            label4.text = response.pages?[0].sections?[1].elements?[3].label
                
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        PageThreeVC.pg1T1 = textBox1.text!
        PageThreeVC.pg1T2 = textBox2.text!
        PageThreeVC.pg1T3 = textBox3.text!
        PageThreeVC.pg1T4 = textBox4.text!
    }
    
    
    
}

/*-------------------------------
 Mark: Date Setup Methods
 -------------------------------*/

extension PageOneVC {
    
    @objc func dateChanged (datePicker: UIDatePicker, textField: UITextField) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        dismisskey()
        
        }
    
    func datePickers (textField: UITextField) {
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        textField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(PageOneVC.dateChanged(datePicker: textField:)), for: .valueChanged)
        datePicker?.backgroundColor = .white
    }
    
    func changeInputType (type : String, index : Int, textFieldArray : [UITextField]) {
        
        print("Input type: \(type), Index: \(index)")
        self.textFieldArray = textFieldArray
        switch type {
        case "formattednumeric" :
            textFieldArray[index].keyboardType = .numberPad
        case "datetime" :
            dateTextField = textFieldArray[index]
            datePickers(textField: dateTextField)
        default:
            print("Can't find what I am looking for")
        }
    }
    
}
/*-------------------------------
 Mark: ScrollView Delegate Methods
 -------------------------------*/

extension PageOneVC : UIScrollViewDelegate {
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        
    }
    
}
