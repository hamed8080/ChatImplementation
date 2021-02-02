//
//  ViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 1/26/21.
//

import UIKit
import FanapPodChatSDK

class ViewController: UIViewController , ChatDelegates{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Chat.sharedInstance.delegate = self
        // Do any additional setup after loading the view.
        // Chat.sharedInstance.delegate = self
       
        Chat.sharedInstance.createChatObject(object:.init(socketAddress: "wss://chat-sandbox.pod.ir/ws",
                                                          serverName: "chat-server",
                                                          token: "306380d60b5349b0a33ff399e546d8e6"))
    }
    
    func chatConnect() {
        
    }
    
    func chatDisconnect() {
        
    }
    
    func chatReconnect() {
        
    }
    
    func chatReady(withUserInfo: User) {
        
    }
    
    func chatState(state: AsyncStateType) {
        
    }
    
    func chatError(errorCode: Int, errorMessage: String, errorResult: Any?) {
        
    }
    
    func botEvents(model: BotEventModel) {
        
    }
    
    func contactEvents(model: ContactEventModel) {
        
    }
    
    func fileUploadEvents(model: FileUploadEventModel) {
        
    }
    
    func messageEvents(model: MessageEventModel) {
        
    }
    
    func systemEvents(model: SystemEventModel) {
        
    }
    
    func threadEvents(model: ThreadEventModel) {
        
    }
    
    func userEvents(model: UserEventModel) {
        
    }

}

