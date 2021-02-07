//
//  UpdateTokenViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 2/7/21.
//

import Foundation
import UIKit
import FanapPodChatSDK

class UpdateTokenViewController: UIViewController {
    
    
    @IBOutlet weak var tfNewToken      : UITextField!
    @IBOutlet weak var txtTokenExpired : UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    @IBAction func btnNewTokenTaped(_ sender: UIButton) {
        guard let newToken = tfNewToken.text else {return}
        Chat.sharedInstance.setToken(newToken: newToken)
        txtTokenExpired.isHidden = true
    }
    
}
