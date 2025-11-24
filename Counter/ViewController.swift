//
//  ViewController.swift
//  Counter
//
//  Created by Екатерина Барданова on 18. 11. 2025..
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var countLabel: UILabel!
    
    @IBOutlet private weak var countButton: UIButton!
    
    @IBOutlet private weak var minusButton: UIButton!
    
    @IBOutlet private weak var zeroButton: UIButton!
    
    @IBOutlet private weak var historyOfChanges: UITextView!
    
    private var countValue: Int = 0
    private var historyText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func currentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: Date())
    }
    
    @IBAction private func plusButtonTouched(_ sender: Any) {
        countValue += 1
        countLabel.text = "Значение счетчика:\(countValue)"
        
        
        let stringHistory = "\(currentDateTime()): значение изменено на +1\n"
        historyText += stringHistory
        historyOfChanges.text = historyText
        
    }
        
    @IBAction private func minusButtonTouched(_ sender: Any) {
        if countValue > 0 {
            countValue -= 1
            countLabel.text = "Значение счетчика:\(countValue)"
            
            let stringHistory = "\(currentDateTime()): значение изменено на -1\n"
            historyText += stringHistory
            historyOfChanges.text = historyText
        } else {
            let stringHistory = "\(currentDateTime()): попытка уменьшить значение счётчика ниже 0\n"
            historyText += stringHistory
            historyOfChanges.text = historyText
        }
        
    }
    
    @IBAction private func zeroButtonTouched(_ sender: Any) {
        countValue = 0
        countLabel.text = "Значение счетчика:\(countValue)"
        
        let stringHistory = "\(currentDateTime()): значение сброшено\n"
        historyText += stringHistory
        historyOfChanges.text = historyText
    }
}
    

