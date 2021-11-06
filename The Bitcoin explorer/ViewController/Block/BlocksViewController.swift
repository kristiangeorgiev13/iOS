//
//  BlocksViewController.swift
//  The Bitcoin explorer
//
//  Created by Kristian Georgiev on 6.11.21.
//

import UIKit

class BlocksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var tableView: UITableView!
    var storedInfoFromLocalBase: [SingleBlock] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        let textFieldCell = UINib(nibName: "BlocksTableViewCell",
                                      bundle: nil)
        self.tableView.register(textFieldCell,
                                    forCellReuseIdentifier: "BlocksTableViewCell")
        
        // adding dummies

        var dummyInfo = [SingleBlock(time: 5, height: 20, mrkl_root: "test1", hash: "y", nonce: 2, tx: []),
                                   SingleBlock(time: 15, height: 230, mrkl_root: "test2", hash: "x", nonce: 3, tx: [])]
        
        let sortedArray = dummyInfo.sort{ $0.time < $1.time}
        self.storedInfoFromLocalBase = dummyInfo
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //ks that are available in the local
//        database sorted by time s
        return storedInfoFromLocalBase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BlocksTableViewCell", for: indexPath) as! BlocksTableViewCell
        cell.heightLabel.text = "time: \(storedInfoFromLocalBase[indexPath.row].height)"
        cell.timeLabel.text = "height: \(storedInfoFromLocalBase[indexPath.row].time)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BlockDetailsViewController") as! BlockDetailsViewController
        let item = storedInfoFromLocalBase[indexPath.row]
        vc.hashString = item.hash
        vc.height = item.height
        vc.time = item.time
        vc.rootString = item.mrkl_root
        vc.transactionString = item.tx
        vc.nouce = item.nonce
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

