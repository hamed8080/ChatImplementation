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
    
    private let messageId    = 1359279
    private let threadId     = 274540
    private let ownerId      = 3637251
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func btnPinMessageTaped(_ button:UIButton) {
        Chat.sharedInstance.pinMessage(.init(messageId: messageId)) { response in
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
        Chat.sharedInstance.unpinMessage(.init(messageId: messageId)) { response in
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
		Chat.sharedInstance.clearHistory(.init(threadId:threadId)) { response in
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
        Chat.sharedInstance.deleteMessage(.init(deleteForAll: true, messageId:messageId)) { response in
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
	
	@IBAction func btnBatchDeleteMessageTaped(_ button:UIButton) {
		Chat.sharedInstance.batchDeleteMessage(.init(threadId: threadId, messageIds: [1358571,1358570])) { response in
			if let deletedMessage = response.result as? DeleteMessage{
				print(deletedMessage)
			}
		}
	}
	
	@IBAction func btnBatchDeleteMessageOldTaped(_ button:UIButton) {
		let req = DeleteMultipleMessagesRequest(deleteForAll: true, messageIds: [1358583,1358582], threadId: threadId, typeCode: nil)
		Chat.sharedInstance.deleteMultipleMessages(inputModel: req, uniqueIds: { uniqueIds in
			print(uniqueIds)
		}, completion: { result in
			print(result)
		})
	}
	
	
	@IBAction func btnGetAllUnreadMessageCountTaped(_ button:UIButton) {
		Chat.sharedInstance.allUnreadMessageCount(.init(countMutedThreads: true)) { response in
			if let unreadCount = response.result as? Int{
				print(unreadCount)
			}
		}
	}
	
	@IBAction func btnGetAllUnreadMessageCountOldTaped(_ button:UIButton) {
		let req = GetAllUnreadMessageCountRequest(countMuteThreads: true, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.getAllUnreadMessagesCount(inputModel: req, getCacheResponse: false, uniqueId: { uniqueId in
			print(uniqueId)
		}, completion: { result in
			print(result)
		}, cacheResponse: { result in
			print(result)
		})
	}
	
	@IBAction func btnGetMentionedTaped(_ button:UIButton) {
		Chat.sharedInstance.getMentions(.init(threadId: threadId, onlyUnreadMention: false)) { response in
			if let history = response.result as? [Message]{
				print(history)
			}
		}
	}
	
	@IBAction func btnGetMentionedOldTaped(_ button:UIButton) {
		let req = GetMentionedRequest(count: 50, offset: 0, threadId: threadId, onlyUnreadMention: false, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.getMentionList(inputModel: req, getCacheResponse: false, uniqueId: { uniqueId in
			print(uniqueId)
		}, completion: { result in
			print(result)
		}, cacheResponse: { result in
			print(result)
		})
	}
	
	@IBAction func btnGetMessageDeliveredUserTaped(_ button:UIButton) {
		Chat.sharedInstance.messageDeliveryParticipants(.init(messageId:messageId)) { response in
			if let deliveredUsers = response.result as? [Participant]{
				print(deliveredUsers)
			}
		}
	}
	
	@IBAction func btnGetMessageDeliveredOldTaped(_ button:UIButton) {
		let req = GetMessageDeliveredSeenListRequest(count: 50, messageId: messageId, offset: 0, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.messageDeliveryList(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { result in
			print(result)
		}
	}
	
	@IBAction func btnGetMessageSeenByUsersTaped(_ button:UIButton) {
		Chat.sharedInstance.messageSeenByUsers(.init(messageId:messageId)) { response in
			if let seenUsers = response.result as? [Participant]{
				print(seenUsers)
			}
		}
	}
	
	@IBAction func btnGetMessageSeenByUsersOldTaped(_ button:UIButton) {
		let req = GetMessageDeliveredSeenListRequest(count: 50, messageId: messageId, offset: 0, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.messageSeenList(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { result in
			print(result)
		}
	}
	
	@IBAction func btnNotifyMessageDeliveredTaped(_ button:UIButton) {
		Chat.sharedInstance.deliver(.init(messageId:messageId)) { response in
			//no response back
		}
	}
	
	@IBAction func btnNotifyMessageDeliveredOldTaped(_ button:UIButton) {
		let req = SendDeliverSeenRequest(messageId: messageId, ownerId: ownerId, typeCode: nil)
		Chat.sharedInstance.deliver(inputModel: req)
	}
	
	
	@IBAction func btnNotifyMessageSeenedTaped(_ button:UIButton) {
		Chat.sharedInstance.seen(.init(messageId:messageId)) { response in
			//no response back
		}
	}
	
	@IBAction func btnNotifyMessageSeenedOldTaped(_ button:UIButton) {
		let req = SendDeliverSeenRequest(messageId: messageId, ownerId: ownerId, typeCode: nil)
		Chat.sharedInstance.seen(inputModel: req)
	}
}
