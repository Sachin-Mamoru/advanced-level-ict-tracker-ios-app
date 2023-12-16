import UIKit

class MortgageViewController: UIViewController {

    // Outlets
    @IBOutlet weak var loanAmountTF: UITextField!
    @IBOutlet weak var interestTF: UITextField!
    @IBOutlet weak var paymentTF: UITextField!
    @IBOutlet weak var noOfYearsTF: UITextField!
    
    @IBOutlet weak var calcButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("mortgage", comment: "")
        
        // Add clear all button
        let clearItem = UIBarButtonItem(title: NSLocalizedString("clear", comment: ""), style: .plain, target: self, action: #selector(clearMortgage(sender:)))
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = clearItem
    }
    
    // Custom methods
    
    // Clear all text fields
    @objc func clearMortgage(sender: UIBarButtonItem) {
        clearEachValue(field: loanAmountTF)
        clearEachValue(field: interestTF)
        clearEachValue(field: paymentTF)
        clearEachValue(field: noOfYearsTF)
        
        calcButton.layer.cornerRadius = 18
    }
    
    func clearEachValue(field: UITextField) {
        field.text = ""
        field.clearButtonMode = .always
    }
    
    // Action method for the Calculate button
    @IBAction func calculateMortgage(_ sender: Any) {
        // Check which parameters are missing
        let loanAmount = Double(loanAmountTF.text ?? "")
        let interest = Double(interestTF.text ?? "")
        let payment = Double(paymentTF.text ?? "")
        let noOfYears = Double(noOfYearsTF.text ?? "")
        
        // Count the number of missing parameters
        var missingParameters = 0
        if loanAmount == nil { missingParameters += 1 }
        if interest == nil { missingParameters += 1 }
        if payment == nil { missingParameters += 1 }
        if noOfYears == nil { missingParameters += 1 }
        
        // If there is only one missing parameter, calculate it
        if missingParameters == 1 {
            if loanAmount == nil {
                // Calculate the Loan Amount
                if let interestRate = interest, let numberOfYears = noOfYears, let monthlyPayment = payment {
                    let r = interestRate / 12.0
                    let n = numberOfYears * 12.0
                    let PV = monthlyPayment * ((1 - pow(1 + r, -n)) / r)
                    loanAmountTF.text = String(format: "%.2f", PV)
                }
            } else if interest == nil {
                // Calculate the Interest Rate
                if let loanAmountValue = loanAmount, let numberOfYears = noOfYears, let monthlyPayment = payment {
                    let n = numberOfYears * 12.0
                    let r = (pow((monthlyPayment / loanAmountValue), 1 / n) - 1) * 12.0
                    interestTF.text = String(format: "%.2f", r * 100.0)
                }
            } else if payment == nil {
                // Calculate the Payment
                if let loanAmountValue = loanAmount, let interestRate = interest, let numberOfYears = noOfYears {
                    let r = interestRate / 12.0
                    let n = numberOfYears * 12.0
                    let PMT = loanAmountValue * (r * pow(1 + r, n)) / (pow(1 + r, n) - 1)
                    paymentTF.text = String(format: "%.2f", PMT)
                }
            } else if noOfYears == nil {
                // Calculate the Number of Years
                if let loanAmountValue = loanAmount, let interestRate = interest, let monthlyPayment = payment {
                    let r = interestRate / 12.0
                    let n = log(monthlyPayment / (monthlyPayment - r * loanAmountValue)) / log(1 + r)
                    noOfYearsTF.text = String(format: "%.2f", n / 12.0)
                }
            }
        } else {
            // More than one missing parameter, display an error message
            showAlert(message: "Please provide only one missing parameter to calculate.")
        }
    }

    // Add a method to display an alert
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
