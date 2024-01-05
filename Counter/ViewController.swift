//
//  ViewController.swift
//  Counter
//
//  Created by d.r.ergashev on 05/01/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countButton: UIButton!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var textCounterView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let range = NSMakeRange(textCounterView.text.count - 1, 0)
        textCounterView.scrollRangeToVisible(range)
        textCounterView.isEditable = false
    }
    
    var counter = 0
    
    func date() -> String {
        let todayDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let dateString = dateFormatter.string(from: todayDate)
        print(dateString)
        return dateString
    }
    
    @IBAction func minusCounterButton(_ sender: UIButton) {
        if counter == 0 {
            textCounterView.text.append("\n «\(date()): попытка уменьшить значение счётчика ниже 0»")
        }
        if counter > 0 && counter != 0 {
            var minusCounter = counter - 1
            counter = minusCounter
            countLabel.text = String(minusCounter)
            textCounterView.text.append("\n «\(date()): значение изменено на -1»")
        }
    }
    
    @IBAction func plusCounterButton(_ sender: UIButton) {
        var plusCounter = counter + 1
        counter = plusCounter
        countLabel.text = String(plusCounter)
        textCounterView.text.append("\n «\(date()): значение изменено на +1»")
    }
    
    @IBAction func zeroCounterButton(_ sender: UIButton) {
        counter = 0
        countLabel.text = String(counter)
        textCounterView.text.append("\n «\(date()): значение сброшено»")
    }
}

