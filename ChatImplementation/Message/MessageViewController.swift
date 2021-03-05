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
        Chat.sharedInstance.pinMessage(.init(messageId: messageId)) { response , error in
			print(response ?? "")
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
        Chat.sharedInstance.unpinMessage(.init(messageId: messageId)) { response , error in
            print(response ?? "")
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
		Chat.sharedInstance.clearHistory(.init(threadId:threadId)) { threadId , error in
            print(threadId ?? "")
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
        Chat.sharedInstance.deleteMessage(.init(deleteForAll: true, messageId:messageId)) { response , error in
            print(response ?? "")
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
		Chat.sharedInstance.batchDeleteMessage(.init(threadId: threadId, messageIds: [1358571,1358570])) { response , error in
            print(response ?? "")
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
		Chat.sharedInstance.allUnreadMessageCount(.init(countMutedThreads: true)) { unreadCount , error in
			print(unreadCount ?? "")
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
		Chat.sharedInstance.getMentions(.init(threadId: threadId, onlyUnreadMention: false)) { response , error in
			print(response ?? "")
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
		Chat.sharedInstance.messageDeliveryParticipants(.init(messageId:messageId)) { response , error in
			print(response ?? "")
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
		Chat.sharedInstance.messageSeenByUsers(.init(messageId:messageId)) { response , error in
			 print(response ?? "")
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
		Chat.sharedInstance.deliver(.init(messageId:messageId))
	}
	
	@IBAction func btnNotifyMessageDeliveredOldTaped(_ button:UIButton) {
		let req = SendDeliverSeenRequest(messageId: messageId, ownerId: ownerId, typeCode: nil)
		Chat.sharedInstance.deliver(inputModel: req)
	}
	
	
	@IBAction func btnNotifyMessageSeenedTaped(_ button:UIButton) {
		Chat.sharedInstance.seen(.init(messageId:messageId))
	}
	
	@IBAction func btnNotifyMessageSeenedOldTaped(_ button:UIButton) {
		let req = SendDeliverSeenRequest(messageId: messageId, ownerId: ownerId, typeCode: nil)
		Chat.sharedInstance.seen(inputModel: req)
	}
    
    @IBAction func btnSendTextMessageTaped(_ button:UIButton) {
        let req = NewSendTextMessageRequest(threadId: threadId, textMessage: "from new text", messageType: .TEXT)
        Chat.sharedInstance.sendTextMessage(req, uniqueIdresult: nil) { sentResult , error in
            print(sentResult ?? "")
        } onSeen: { seenResult , error in
            print(seenResult ?? "")
        } onDeliver: { deliverResult , error in
            print(deliverResult ?? "")
        }
    }
    
    @IBAction func btnSendTextMessageOldTaped(_ button:UIButton) {
        let req = SendTextMessageRequest(content: "hello test 2",
                                         messageType: .TEXT,
                                         metadata: nil,
                                         repliedTo: nil,
                                         systemMetadata: nil,
                                         threadId: threadId,
                                         typeCode: nil,
                                         uniqueId: nil)
        Chat.sharedInstance.sendTextMessage(inputModel: req) { uniqueId in
            print(uniqueId)
        } onSent: { result in
            print(result)
        } onDelivere: { result in
            print(result)
        } onSeen: { result in
            print(result)
        }

    }
}
