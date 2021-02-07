//
//  ChatDelegateImplementation.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 2/6/21.
//

import Foundation
import FanapPodChatSDK

class ChatDelegateImplementation: ChatDelegates {
    
    //Sandbox
//    let socketAddresss = "wss://chat-sandbox.pod.ir/ws"
//    let serverName     = "chat-server"
//    let ssoHost        = "https://accounts.pod.ir"
//    let platformHost   = "https://sandbox.pod.ir:8043/srv/basic-platform"
//    let fileServer     = "http://sandbox.fanapium.com:8080"
    
    //Main
    
    let socketAddresss = "wss://msg.pod.ir/ws"
    let serverName     = "chat-server"
    let ssoHost        = "https://accounts.pod.ir"
    let platformHost   = "https://api.pod.ir/srv/core"
    let fileServer     = "https://core.pod.ir"
    
	private (set) static var sharedInstance = ChatDelegateImplementation()
    
    func createChatObject(){
        Chat.sharedInstance.createChatObject(object: .init(socketAddress: socketAddresss,
                                                           serverName: serverName,
                                                           token: "89ec9ddfbd114e50a75c5a80f52a941e",
                                                           ssoHost: ssoHost,
                                                           platformHost: platformHost,
                                                           fileServer: fileServer,
                                                           reconnectOnClose: true
         ))
        Chat.sharedInstance.delegate = self
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
		if errorCode == 21 {
            let st = UIStoryboard(name: "Main", bundle: nil)
            let vc = st.instantiateViewController(identifier: "UpdateTokenController")
            guard let rootVC = SceneDelegate.getRootViewController() else {return}
            rootVC.present(vc, animated: false)
		}
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
