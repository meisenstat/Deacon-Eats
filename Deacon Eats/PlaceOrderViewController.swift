//
//  PlaceOrderViewController.swift
//  Deacon Eats
//
//  Created by Mitch Eisenstat on 3/3/19.
//  Copyright © 2019 Mitch Eisenstat. All rights reserved.
//

import Foundation
import UIKit

class PlaceOrderViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {

    @IBOutlet weak var destinationButton: UIButton!
    @IBOutlet weak var timeLimitButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    var destinations = ["Luter", "Babcock", "Johnson", "Bostwick", "South", "Angeleau", "Collins", "Kitchen", "Poteat", "Davis", "Taylor", "Piccolo", "Palmer", "Huffman", "Efrid", "Dogwood", "Magnolia", "Polo", "Martin", "NCA"]
    var timeOptions = [[0, 1, 2, 3, 4, 5, 6], [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55]]
    
    var selectedDestination = "None"
    var selectedTime = [0,0]
    var otherInstructions = "None"
    
    var pickerView = UIView()
    var otherView = UIView()
    let destinationPicker = UIPickerView()
    let timePicker = UIPickerView()
    let otherTextView = UITextView()
    
    var restaurant = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIResponder.keyboardWillShowNotification, object: nil)
        setUpObserver()
        setupGeneral()
        setupDestinations()
        setupTimes()
        setupOther()
        dismissPicker()
        dismissText()
        view.addSubview(pickerView)
        view.addSubview(otherView)
        print("rest: ", restaurant)
    }
    
    private func setUpObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc fileprivate func keyboardWillShow(notification:NSNotification) {
        if let keyboardRectValue = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardRectValue.minY
            print("height: ", keyboardHeight)
            print("diff", keyboardHeight - otherButton.frame.maxY)
            
//            otherView = UIView(frame: CGRect(x: 0, y: otherButton.frame.maxY + 20, width: view.frame.width, height: keyboardHeight - otherButton.frame.maxY - 44))
            print("frame before: ", otherView.frame)
            otherView.frame = CGRect(x: 0, y: otherButton.frame.maxY + 20, width: view.frame.width, height: keyboardHeight - otherButton.frame.maxY - 44)
            print("frame after: ", otherView.frame)
            otherTextView.frame = CGRect(x: 0, y: 44, width: self.view.frame.size.width, height: otherView.frame.size.height-44)
//            dismissText()
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        // keyboard is dismissed/hidden from the screen
    }
    
    func setupGeneral() {
        // set title
        self.navigationItem.title = restaurant
        
        // setup button locations
        destinationButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        destinationButton.titleEdgeInsets.left = 15
        timeLimitButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        timeLimitButton.titleEdgeInsets.left = 15
        otherButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        otherButton.titleEdgeInsets.left = 15
        
        // setup picker parent view
        pickerView = UIView(frame: CGRect(x: 0, y: view.frame.height - 260, width: view.frame.width, height: 260))
        pickerView.isHidden = true
        
        
        // set up other parent view
        
//        var keyboardSize = notification.userInfo(valueForKey(UIKeyboardFrameBeginUserInfoKey))
//        print(keyboardSize)
        
//        otherView = UIView(frame: CGRect(x: 0, y: view.frame.height - 330, width: view.frame.width, height: 330))
        print(otherButton.frame.maxY)
//        otherView = UIView(frame: CGRect(x: 0, y: otherButton.frame.maxY + 20, width: view.frame.width, height: 300))
        otherView = UIView(frame: CGRect(x: 0, y: otherButton.frame.maxY + 20, width: view.frame.width, height: 300))
        otherView.isHidden = true
        
        
    }
    
    func setupDestinations() {
        
        destinationButton.setTitle("Select destination", for: .normal)
        timeLimitButton.setTitle("Select time limit", for: .normal)
        otherButton.setTitle("Add other instructions", for: .normal)
        
        destinations.sort()
        destinationPicker.delegate = self
        destinationPicker.dataSource = self
        destinationPicker.center = CGPoint(x: view.frame.size.width  / 2, y: view.frame.size.height / 2)
        destinationPicker.frame = CGRect(x:0, y:0, width: self.view.frame.size.width, height:pickerView.frame.size.height)
        destinationPicker.backgroundColor = UIColor.lightGray
        
        pickerView.addSubview(destinationPicker)
        
        destinationButton.addTarget(self, action: #selector(PlaceOrderViewController.destClicked), for: UIControl.Event.touchUpInside)
        
    }
    
    func setupTimes() {
        
        timePicker.delegate = self
        timePicker.dataSource = self
        timePicker.center = CGPoint(x: view.frame.size.width  / 2, y: view.frame.size.height / 2)
        timePicker.frame = CGRect(x:0, y:0, width: self.view.frame.size.width, height:pickerView.frame.size.height)
        timePicker.backgroundColor = UIColor.lightGray
        
        pickerView.addSubview(timePicker)
        
        timeLimitButton.addTarget(self, action: #selector(PlaceOrderViewController.timeClicked), for: UIControl.Event.touchUpInside)
    }
    
    func setupOther() {
        otherTextView.delegate = self
        otherTextView.text = "Enter any requests you have that the deliverer should know before accepting your order"
        otherTextView.center = CGPoint(x: view.frame.size.width  / 2, y: view.frame.size.height / 2)
        otherTextView.frame = CGRect(x: 0, y: 44, width: self.view.frame.size.width, height: otherView.frame.size.height-44)
        otherTextView.backgroundColor = UIColor.lightGray
        otherTextView.keyboardAppearance = UIKeyboardAppearance.dark
        otherTextView.keyboardType = UIKeyboardType.asciiCapable
        otherTextView.isEditable = true
        
        otherTextView.returnKeyType = .done
        
        otherView.addSubview(otherTextView)
        
        otherButton.addTarget(self, action: #selector(PlaceOrderViewController.otherClicked), for: UIControl.Event.touchUpInside)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text as NSString).rangeOfCharacter(from: CharacterSet.newlines).location == NSNotFound {
            return true
        }
        otherTextView.resignFirstResponder()
        return false
    }
    
    func dismissPicker() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissPickerView))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        pickerView.addSubview(toolbar)
    }
    
    func dismissText() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissKeyboard))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        otherView.addSubview(toolbar)
    }
    
    @objc func otherClicked(sender: UIButton) {
        pickerView.isHidden = true
        otherView.isHidden = false
        otherTextView.isHidden = false
        print("Clicked")
    }
    
    @objc func destClicked(sender: UIButton) {
        otherView.isHidden = true
        timePicker.isHidden = true
        
        pickerView.isHidden = false
        destinationPicker.isHidden = false
    }
    
    @objc func timeClicked(sender: UIButton) {
        otherView.isHidden = true
        destinationPicker.isHidden = true
        
        pickerView.isHidden = false
        timePicker.isHidden = false
    }
    
    @objc func dismissPickerView() {
        
        // case that user was picking time
        if(destinationPicker.isHidden == true) {
            timeLimitButton.setTitle("Time Limit: " + String(selectedTime[0]) + " hours, " + String(selectedTime[1]) + " minutes", for: .normal)
        }
        else { // case that user was picking destination
            destinationButton.setTitle("Destination: " + selectedDestination, for: .normal)
        }
        
        pickerView.isHidden = true
        destinationPicker.isHidden = true
        timePicker.isHidden = true
        
    }
    
    @objc func dismissKeyboard() {
        otherTextView.resignFirstResponder()
        otherInstructions = otherTextView.text
        otherButton.setTitle("Edit instructions", for: .normal)
        otherView.isHidden = true
    }
    
    
    
    
    
    // following functions are for defining the pickers
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if(pickerView == timePicker) {
            return 2
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == timePicker) {
            if(component == 0) {
                return timeOptions[0].count
            } else {
                return timeOptions[1].count
            }
        } else {
            return destinations.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == timePicker) {
            if(component == 0) {
                return String(timeOptions[0][row])
            } else {
                return String(timeOptions[1][row])
            }
        } else {
            return destinations[row]
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if(pickerView == timePicker) {
            return 2
        } else {
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == timePicker) {
            if(component == 0) {
                selectedTime[0] = timeOptions[0][row]
            } else {
                selectedTime[1] = timeOptions[1][row]
            }
        } else {
            selectedDestination = destinations[row]
        }
    }

    
}

//private extension Selector {
//    static let keyboardWillShow = #selector(PlaceOrderViewController.keyboardWillShow(notification:))
//}
