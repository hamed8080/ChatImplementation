//
//  MessageViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 2/20/21.
//

import Foundation
import UIKit
import FanapPodChatSDK

class MessageViewController : UIViewController{
    
    let messageId = 1355240
    let threadId = 318964
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func btnPinMessageTaped(_ button:UIButton) {
        Chat.sharedInstance.request(.PinMessage(.init(messageId: messageId))) { response in
			if let pinResponse = response.result as? PinUnpinMessage{
				print(pinResponse)
			}
		}
	}
	
	@IBAction func btnPinMessageOldTaped(_ button:UIButton) {
        let req = PinUnpinMessageRequest(messageId: messageId, notifyAll: false, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.pinMessage(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
    
    @IBAction func btnUnPinMessageTaped(_ button:UIButton) {
        Chat.sharedInstance.request(.UnPinMessage(.init(messageId: messageId))) { response in
            if let pinResponse = response.result as? PinUnpinMessage{
                print(pinResponse)
            }
        }
    }
    
    @IBAction func btnUnPinMessageOldTaped(_ button:UIButton) {
        let req = PinUnpinMessageRequest(messageId: messageId, notifyAll: false, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.unpinMessage(inputModel: req) { uniqueId in
            print(uniqueId)
        } completion: { response in
            print(response)
        }
    }
    
    @IBAction func btnClearHistoryTaped(_ button:UIButton) {
        Chat.sharedInstance.request(.ClearHistory(threadId:threadId)) { response in
            if let threadId = response.result as? Int{
                print(threadId)
            }
        }
    }
    
    @IBAction func btnClearHistoryOldTaped(_ button:UIButton) {
        let req = ClearHistoryRequest(threadId: threadId, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.clearHistory(inputModel: req) { uniqueId in
            print(uniqueId)
        } completion: { response in
            print(response)
        }
    }
    
    @IBAction func btnDeleteMessageTaped(_ button:UIButton) {
        Chat.sharedInstance.request(.DeleteMessage( req: .init(deleteForAll: true, messageId:messageId ))) { response in
            if let deletedMessage = response.result as? DeleteMessage{
                print(deletedMessage)
            }
        }
    }
    
    @IBAction func btnDeleteMessageOldTaped(_ button:UIButton) {
        let req = DeleteMessageRequest(deleteForAll: true, messageId: messageId, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.deleteMessage(inputModel: req) { uniqueId in
            print(uniqueId)
        } completion: { response in
            print(response)
        }
    }
	
}
