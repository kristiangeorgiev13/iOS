//
//  AccountsViewController.swift
//  The Bitcoin explorer
//
//  Created by Kristian Georgiev on 6.11.21.
//

import UIKit

class AccountsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var storedInfoFromLocalBase: [SingleAddressModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        let textFieldCell = UINib(nibName: "AccountTableViewCell",
                                      bundle: nil)
        self.tableView.register(textFieldCell,
                                    forCellReuseIdentifier: "AccountTableViewCell")
        // dummy
        self.storedInfoFromLocalBase = [SingleAddressModel(hash160: "", address: "", total_received: 0, total_sent: 1, final_balance: 23, txs: [])]
    }
    
    @IBAction func addPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddAccountViewController") as! AddAccountViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storedInfoFromLocalBase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTableViewCell", for: indexPath) as! AccountTableViewCell
        cell.infoLabel.text = "time: \(storedInfoFromLocalBase[indexPath.row].address)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AccountDetailsViewController") as! AccountDetailsViewController
        let item = storedInfoFromLocalBase[indexPath.row]
        vc.hash160 = item.hash160
        vc.address = item.address
        vc.total_received = item.total_received
        vc.total_sent = item.total_sent
        vc.txs = item.txs
        vc.final_balance = item.final_balance
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
