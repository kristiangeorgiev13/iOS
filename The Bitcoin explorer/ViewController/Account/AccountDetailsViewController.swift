//
//  AccountDetailsViewController.swift
//  The Bitcoin explorer
//
//  Created by Kristian Georgiev on 6.11.21.
//

import UIKit

class AccountDetailsViewController: UIViewController {
    @IBOutlet weak var finalLabel: UILabel!
    @IBOutlet weak var addressHashLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var transactionLabel: UILabel!
    @IBOutlet weak var sentLabel: UILabel!
    @IBOutlet weak var recievedLabel: UILabel!
    
    var hash160: String?
    var address: String?
    var total_received: Int?
    var total_sent: Int?
    var txs: [String]?
    var final_balance: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.finalLabel.text = "\(self.final_balance)"
        self.addressHashLabel.text = self.hash160
        self.addressLabel.text = self.address
        self.transactionLabel.text = "\(self.txs?.first)"
        self.sentLabel.text = "\(self.total_sent)"
        self.recievedLabel.text = "\(self.total_received)"
    }
}
