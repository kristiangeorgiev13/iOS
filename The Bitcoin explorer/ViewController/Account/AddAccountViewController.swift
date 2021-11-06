//
//  AddAccountViewController.swift
//  The Bitcoin explorer
//
//  Created by Kristian Georgiev on 6.11.21.
//

import UIKit
import Alamofire

class AddAccountViewController: UIViewController {
    @IBOutlet weak var infoTextField: UITextField!
    var localModel: SingleAddressModel = SingleAddressModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func confirmPressed(_ sender: Any) {
        AF.request("https://blockchain.info/rawaddr/\(infoTextField.text!)").response { response in
            debugPrint(response)
            
            switch response.result {
            case .success(let data):
                // solution2
              //  let info: BlockModel = try! JSONDecoder().decode(BlockModel.self, from: data!)
                
                if let info = data as? SingleAddressModel {
                    self.localModel = info
                    if info.txs?.isEmpty ?? true {
                        print("it is empty")
                    } else {
                        print("store user")
                        let defaults = UserDefaults.standard
                        defaults.set(info.hash160, forKey: "hash160")
                        defaults.set(info.address, forKey: "address")
                        defaults.set(info.total_received, forKey: "total_received")
                        defaults.set(info.txs, forKey: "txs")
                        defaults.set(info.total_sent, forKey: "total_sent")
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            case .failure(let error):
                print("Something went wrong: \(error)")
                self.showAlert()
            }
        }
    }

    @IBAction func dismissPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "OOpsss", message: "Something went wrong.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
