
// Created on: Oct 20
// Created by: Benjamin H
// Created for: ICS3U
// Determines if it is a leap year
import PlaygroundSupport

import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let toppingsLabel = UILabel()
    var numberOfToppingsTextField = UITextField ()
    let checkButton = UIButton()
    let answerLabel = UILabel()
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        toppingsLabel.text = "Which year is a Leap Year?"
        view.addSubview(toppingsLabel)
        toppingsLabel.translatesAutoresizingMaskIntoConstraints = false
        toppingsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
            
        toppingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        numberOfToppingsTextField.borderStyle = UITextBorderStyle.roundedRect
        numberOfToppingsTextField.placeholder = "Enter Year"
        view.addSubview(numberOfToppingsTextField)
        numberOfToppingsTextField.translatesAutoresizingMaskIntoConstraints = false
        numberOfToppingsTextField.topAnchor.constraint(equalTo: toppingsLabel.bottomAnchor, constant: 20).isActive = true
        numberOfToppingsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        checkButton.setTitle("Calculate", for: .normal)
        checkButton.setTitleColor(.blue, for: .normal)
        checkButton.titleLabel?.textAlignment = .center
        checkButton.addTarget(self, action: #selector(checkCost), for: .touchUpInside)
        view.addSubview(checkButton)
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton.topAnchor.constraint(equalTo: numberOfToppingsTextField.bottomAnchor, constant: 90).isActive = true
        checkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 170).isActive = true
        
        answerLabel.text = nil
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 20).isActive = true
        answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    
    }
    
    @objc func checkCost() {
        
        var toppings : Double? = nil
        var sizePrice : Double? = nil
        
        //input
        let numberYear : Int = Int(numberOfToppingsTextField.text!)!
        
        // process
        var leapyear : Int = 0
        if (numberYear % 4) == 0 {
            if (numberYear % 100) == 0 {
                if (numberYear % 400) == 0 {
                    leapyear = 1
                }
            } 
            else
            {
                leapyear = 1
            }
        }
            //output
        if (leapyear == 1) {
            let answer = String(format: "%i is a Leap Year!", numberYear);
            answerLabel.text = answer
        }
        else {
            let answer = String(format: "%i is not a leap year.", numberYear);
            answerLabel.text = answer
        }
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

PlaygroundPage.current.liveView = ViewController()
