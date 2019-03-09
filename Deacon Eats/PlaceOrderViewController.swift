//
//  PlaceOrderViewController.swift
//  Deacon Eats
//
//  Created by Mitch Eisenstat on 3/3/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation
import UIKit

class PlaceOrderViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var destinationButton: UIButton!
    @IBOutlet weak var timeLimitButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var destinations = ["Luter", "Babcock", "Johnson", "Bostwick", "South", "Angeleau", "Collins", "Kitchen", "Poteat", "Davis", "Taylor", "Piccolo", "Palmer", "Huffman", "Efrid", "Dogwood", "Magnolia", "Polo", "Martin", "NCA"]
    var timeOptions = [[0, 1, 2, 3, 4, 5, 6], [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55]]
    var selectedDestination = "none"
    var pickerView = UIView()
    let destinationPicker = UIPickerView()
    let timePicker = UIPickerView()
    var restaurant = ""
    
//    init() {
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDestinations()
        dismissPicker()
        view.addSubview(pickerView)
        setupGeneral()
        print("rest: ", restaurant)
    }
    
    func setupGeneral() {
        navigationBar.topItem?.title = restaurant
    }
    
    func setupDestinations() {
        pickerView = UIView(frame: CGRect(x: 0, y: view.frame.height - 260, width: view.frame.width, height: 260))
        pickerView.isHidden = true
        
        destinationButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        destinationButton.titleEdgeInsets.left = 15
        timeLimitButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        timeLimitButton.titleEdgeInsets.left = 15
        otherButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        otherButton.titleEdgeInsets.left = 15
        
        destinationButton.setTitle("Select destination", for: .normal)
        timeLimitButton.setTitle("Select time limit", for: .normal)
        otherButton.setTitle("Add other instructions", for: .normal)
        
        destinations.sort()
        destinationPicker.delegate = self
        destinationPicker.dataSource = self
        destinationPicker.center = CGPoint(x: view.frame.size.width  / 2, y: view.frame.size.height / 2)
        destinationPicker.frame = CGRect(x:0, y:0, width: self.view.frame.size.width, height:pickerView.frame.size.height)
        destinationPicker.backgroundColor = UIColor.lightGray
//        picker.layer.borderColor = UIColor.black.cgColor
//        picker.layer.borderWidth = 1
        pickerView.addSubview(destinationPicker)
        
        destinationButton.addTarget(self, action: #selector(PlaceOrderViewController.destClicked), for: UIControl.Event.touchUpInside)
        
    }
    
    func dismissPicker() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissKeyboard))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        pickerView.addSubview(toolbar)
        
    }
    
    @objc func destClicked(sender: UIButton) {
        pickerView.isHidden = false
        destinationPicker.isHidden = false
        
    }
    
    @objc func dismissKeyboard() {
        pickerView.isHidden = true
        destinationPicker.isHidden = true
        timePicker.isHidden = true
        destinationButton.setTitle("Destination: " + selectedDestination, for: .normal)
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {return 1}
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {return destinations.count}
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {return destinations[row]}
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return destinations[row]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDestination = destinations[row]
    }

    
}
