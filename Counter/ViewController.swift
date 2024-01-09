//
//  ViewController.swift
//  Counter
//
//  Created by d.r.ergashev on 05/01/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var countButton: UIButton!
    
    @IBOutlet weak private var countLabel: UILabel!
    
    @IBOutlet weak private var textCounterView: UITextView!
    
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let range = NSMakeRange(textCounterView.text.count - 1, 0)
        textCounterView.scrollRangeToVisible(range)
        textCounterView.isEditable = false
    }
    
    private func getCurrentDateString() -> String {
        let todayDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let dateString = dateFormatter.string(from: todayDate)
        print(dateString)
        return dateString
    }
    
    @IBAction private func minusCounterButton(_ sender: UIButton) {
        if counter == 0 {
            textCounterView.text.append("\n «\(getCurrentDateString()): попытка уменьшить значение счётчика ниже 0»")
        }
        if counter > 0 && counter != 0 {
            var minusCounter = counter - 1
            counter = minusCounter
            countLabel.text = String(minusCounter)
            textCounterView.text.append("\n «\(getCurrentDateString()): значение изменено на -1»")
        }
    }
    
    @IBAction private func plusCounterButton(_ sender: UIButton) {
        var plusCounter = counter + 1
        counter = plusCounter
        countLabel.text = String(plusCounter)
        textCounterView.text.append("\n «\(getCurrentDateString()): значение изменено на +1»")
    }
    
    @IBAction private func zeroCounterButton(_ sender: UIButton) {
        counter = 0
        countLabel.text = String(counter)
        textCounterView.text.append("\n «\(getCurrentDateString()): значение сброшено»")
    }
}

