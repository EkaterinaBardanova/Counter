//
//  ViewController.swift
//  Counter
//
//  Created by Екатерина Барданова on 18. 11. 2025..
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var count: UILabel!
    
    @IBOutlet weak var countButton: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!
    
    @IBOutlet weak var historyOfChanges: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var countValue: Int = 0
    var historyText: String = ""
    
    func currentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: Date())
    }
    
    @IBAction func plusButtonTouched(_ sender: Any) {
        countValue += 1
        count.text = "Значение счетчика:\(countValue)"
        
        
        let stringHistory = "\(currentDateTime()): значение изменено на +1\n"
        historyText += stringHistory
        historyOfChanges.text = historyText
        
    }
        
    @IBAction func minusButtonTouched(_ sender: Any) {
        if countValue > 0 {
            countValue -= 1
            count.text = "Значение счетчика:\(countValue)"
            
            let stringHistory = "\(currentDateTime()): значение изменено на -1\n"
            historyText += stringHistory
            historyOfChanges.text = historyText
        } else {
            let stringHistory = "\(currentDateTime()): попытка уменьшить значение счётчика ниже 0\n"
            historyText += stringHistory
            historyOfChanges.text = historyText
        }
        
    }
    
    @IBAction func zeroButtonTouched(_ sender: Any) {
        countValue = 0
        count.text = "Значение счетчика:\(countValue)"
        
        let stringHistory = "\(currentDateTime()): значение сброшено\n"
        historyText += stringHistory
        historyOfChanges.text = historyText
    }
}
    

