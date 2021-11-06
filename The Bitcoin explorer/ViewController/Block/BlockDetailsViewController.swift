//
//  BlockDetailsViewController.swift
//  The Bitcoin explorer
//
//  Created by Kristian Georgiev on 6.11.21.
//

import UIKit

class BlockDetailsViewController: UIViewController {
    
    @IBOutlet weak var hashlabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var rootLabel: UILabel!
    @IBOutlet weak var transactionLabel: UILabel!
    @IBOutlet weak var nouceLabel: UILabel!
  
    
    var hashString: String?
    var height: Int?
    var time: Int?
    var rootString: String?
    var transactionString: [String]?
    var nouce: Int?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .yellow
        self.hashlabel.text = self.hashString
        self.heightLabel.text = "\(String(describing: self.height))"
        self.timeLabel.text = "\(String(describing: self.time))"
        self.rootLabel.text = self.rootString
        self.transactionLabel.text = self.transactionString?.first
        self.nouceLabel.text = "\(String(describing: self.nouce))"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
