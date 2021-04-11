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
    
    private let messageId    = 1474840
    private let threadId     = 274540
    private let ownerId      = 3637251
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
    
    @IBAction func btnGetHistoryTaped(_ button:UIButton) {
        let req = NewGetHistoryRequest(threadId: threadId)
        Chat.sharedInstance.getHistory(req){ response, uniqueId  , pagination , error in
            print(response ?? "")
        }cacheResponse: { messages, uniqueId  , error in
            print(messages ?? "")
        }textMessageNotSentRequests: { requests, uniqueId , error in
            print(requests ?? "")
        }editMessageNotSentRequests: { requests, uniqueId , error in
            print(requests ?? "")
        }forwardMessageNotSentRequests: { requests, uniqueId , error in
            print(requests ?? "")
        }fileMessageNotSentRequests: { requests, uniqueId, error in
            print(requests ?? "")
        }uploadFileNotSentRequests: { filesResuests, uniqueId, error in
            print(filesResuests ?? "")
        }uploadImageNotSentRequests: { imageRequests, uniqueId, error in
            print(imageRequests ?? "")
        }uniqueIdResult: { uniqueId in
            print(uniqueId)
        }
    }
    
    @IBAction func btnGetHistoryOldTaped(_ button:UIButton) {
        let req = GetHistoryRequest(count: 50,
                                    fromTime: nil,
                                    fromTimeNanos: nil,
                                    messageId: nil,
                                    messageType: nil,
                                    metadataCriteria: nil,
                                    offset: 0,
                                    order: nil,
                                    query: nil,
                                    threadId: threadId,
                                    toTime: nil,
                                    toTimeNanos: nil,
                                    uniqueIds: nil,
                                    userId: nil,
                                    typeCode: nil,
                                    uniqueId: nil)
        Chat.sharedInstance.getHistory(inputModel: req, getCacheResponse: false) { uniqueId in
            print(uniqueId)
        } completion: { response in
            print(response)
        } cacheResponse: { response in
            print(response)
        } textMessagesNotSent: { response in
            print(response)
        } editMessagesNotSent: { response in
            print(response)
        } forwardMessagesNotSent: { response in
            print(response)
        } fileMessagesNotSent: { response in
            print(response)
        } uploadImageNotSent: { response in
            print(response)
        } uploadFileNotSent: { response in
            print(response)
        }
    }
    
    @IBAction func btnGetHistoryWithresendAllQueueTaped(_ button:UIButton) {
        let req = NewGetHistoryRequest(threadId: threadId)
        Chat.sharedInstance.getHistory(req){ response, uniqueId  , pagination , error in
            print(response ?? "")
        }cacheResponse: { messages, uniqueId  , error in
            print(messages ?? "")
        }textMessageNotSentRequests: { requests, uniqueId , error in
            print(requests ?? "")
            //resend if you need to callbacks use full method parameters.
            requests?.forEach({ request in
                Chat.sharedInstance.sendTextMessage(request)
            })
        }editMessageNotSentRequests: { requests, uniqueId , error in
            print(requests ?? "")
            requests?.forEach({ request in
                Chat.sharedInstance.editMessage(request)
            })
        }forwardMessageNotSentRequests: { requests, uniqueId , error in
            requests?.forEach({ request in
                Chat.sharedInstance.forwardMessages(request)
            })
        }fileMessageNotSentRequests: { requests, uniqueId, error in
            print(requests ?? "")
            requests?.forEach({ request in
                Chat.sharedInstance.sendFileMessage(textMessage: request.1, uploadFile: request.0)
            })
        }uploadFileNotSentRequests: { filesResuests, uniqueId, error in
            print(filesResuests ?? "")
            filesResuests?.forEach({ request in
                Chat.sharedInstance.uploadFile(req: request, uploadCompletion: nil)
            })
        }uploadImageNotSentRequests: { imageRequests, uniqueId, error in
            print(imageRequests ?? "")
            imageRequests?.forEach({ request in
                Chat.sharedInstance.uploadImage(req: request, uploadCompletion: nil)
            })
        }uniqueIdResult: { uniqueId in
            print(uniqueId)
        }
    }

	@IBAction func btnPinMessageTaped(_ button:UIButton) {
        Chat.sharedInstance.pinMessage(.init(messageId: messageId)) { response, uniqueId , error in
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
        Chat.sharedInstance.unpinMessage(.init(messageId: messageId)) { response, uniqueId , error in
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
        Chat.sharedInstance.clearHistory(.init(threadId:threadId)) { threadId, uniqueId , error in
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
        Chat.sharedInstance.deleteMessage(.init(deleteForAll: true, messageId:messageId)) { response, uniqueId , error in
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
		Chat.sharedInstance.deleteMultipleMessages(.init(threadId: threadId, messageIds: [1396895,1396894,1396893])) { response, uniqueId , error in
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
		Chat.sharedInstance.allUnreadMessageCount(.init(countMutedThreads: true)) { unreadCount, uniqueId , error in
			print(unreadCount ?? "")
        }cacheResponse: { allUnreadCount, uniqueId , error in
            print(allUnreadCount ?? "")
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
		Chat.sharedInstance.getMentions(.init(threadId: threadId, onlyUnreadMention: false)) { response, uniqueId , pagination , error in
            print(response ?? "")
        } cacheResponse: { mentions, uniqueId , pagination , error in
            print(mentions ?? "")
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
		Chat.sharedInstance.messageDeliveryParticipants(.init(messageId:messageId)) { response, uniqueId , pagination , error in
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
		Chat.sharedInstance.messageSeenByUsers(.init(messageId:messageId)) { response, uniqueId, pagination , error in
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
        Chat.sharedInstance.sendTextMessage(req, uniqueIdresult: nil) { sentResult, uniqueId , error in
            print(sentResult ?? "")
        } onSeen: { seenResult, uniqueId , error in
            print(seenResult ?? "")
        } onDeliver: { deliverResult, uniqueId , error in
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
    
    @IBAction func btnSendReplyMessageTaped(_ button:UIButton) {
        let req = NewReplyMessageRequest(threadId: threadId, repliedTo: 1405217 , textMessage: "from new text", messageType: .TEXT)
        Chat.sharedInstance.replyMessage(req, uniqueIdresult: nil) { sentResult, uniqueId , error in
            print(sentResult ?? "")
        } onSeen: { seenResult, uniqueId , error in
            print(seenResult ?? "")
        } onDeliver: { deliverResult, uniqueId , error in
            print(deliverResult ?? "")
        }
    }
    
    @IBAction func btnSendReplyMessageOldTaped(_ button:UIButton) {
       let req = ReplyTextMessageRequest(content: "hello test 2",
                                messageType: .TEXT,
                                metadata: nil,
                                repliedTo: 2200,
                                subjectId: threadId,
                                typeCode: nil,
                                uniqueId: nil)
        Chat.sharedInstance.replyMessage(inputModel: req) { uniqueId in
            print(uniqueId)
        } onSent: { result in
            print(result)
        } onDelivere: { result in
            print(result)
        } onSeen: { result in
            print(result)
        }
    }
    
    @IBAction func btnEditMessageTaped(_ button:UIButton) {
        let req = NewEditMessageRequest(threadId: threadId, messageType: .TEXT ,messageId: messageId, textMessage: "Edited Text Meessage \(Date())")
        Chat.sharedInstance.editMessage(req) { message, uniqueId , error in
            print(message ?? "")
        }
    }
    
    @IBAction func btnEditMessageOldTaped(_ button:UIButton) {
        let req = EditTextMessageRequest(messageType: .TEXT,
                               repliedTo: nil,
                               messageId: messageId,
                               textMessage: "Edited text",
                               typeCode: nil,
                               uniqueId: nil)
        Chat.sharedInstance.editMessage(inputModel: req) { uniqueId in
            print(uniqueId)
        } completion: { response in
            print(response)
        }
    }
    
    @IBAction func btnForwardMessageTaped(_ button:UIButton) {
        let req = NewForwardMessageRequest(threadId: threadId, messageIds: [1398375,1398253])
        Chat.sharedInstance.forwardMessages(req) { sentResponse, uniqueId, error in
            print(sentResponse ?? "")
        } onSeen: { seenResponse, uniqueId, error in
            print(seenResponse ?? "")
        } onDeliver: { deliverResponse, uniqueId, error in
            print(deliverResponse ?? "")
        } uniqueIdsResult: { uniqueIds in
            print(uniqueIds)
        }
    }
    
    @IBAction func btnForwardMessageOldTaped(_ button:UIButton) {
        let req = ForwardMessageRequest(messageIds: [1398375,1398253],
                                        metadata: nil,
                                        repliedTo: nil,
                                        threadId: threadId,
                                        typeCode: nil)
        Chat.sharedInstance.forwardMessage(inputModel: req) { uniqueId in
            print(uniqueId)
        } onSent: { response in
            print(response)
        } onDelivere: { response in
            print(response)
        } onSeen: { response in
            print(response)
        }
    }
    
    @IBAction func btnSendFileMessageTaped(_ button:UIButton) {
        guard let path = Bundle.main.path(forResource: "test", ofType: "txt"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else{return}
        let message = NewSendTextMessageRequest(threadId: threadId, textMessage: "test file upload message", messageType: .POD_SPACE_FILE)
        let uploadFile = NewUploadFileRequest(data: data,fileExtension: ".txt" , fileName: "test", mimeType: "text/plain" , userGroupHash: "RZFAGPKJEOWQIR")
        Chat.sharedInstance.sendFileMessage(textMessage:message, uploadFile: uploadFile){ uploadFileProgress ,error in
            print(uploadFileProgress ?? error ?? "")
        }onSent: { sentResponse, uniqueId, error in
            print(sentResponse ?? "")
        }onSeen: { seenResponse, uniqueId, error in
            print(seenResponse ?? "")
        }onDeliver: { deliverResponse, uniqueId, error in
            print(deliverResponse ?? "")
        }uploadUniqueIdResult:{ uploadUniqueId in
            print(uploadUniqueId)
        }messageUniqueIdResult:{ messageUniqueId in
           print(messageUniqueId)
        }
    }
    
    @IBAction func btnSendFileMessageOldTaped(_ button:UIButton) {
        guard let path = Bundle.main.path(forResource: "test", ofType: "txt"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else{return}
        let textRequest = SendTextMessageRequest(content: "check this file message",
                                                 messageType: .POD_SPACE_FILE,
                                                 metadata: nil,
                                                 repliedTo: nil,
                                                 systemMetadata: nil,
                                                 threadId: threadId,
                                                 typeCode: nil,
                                                 uniqueId: nil)
        let uploadrequest = UploadFileRequest(dataToSend: data,
                                              fileExtension: nil,
                                              fileName: "test",
                                              mimeType: nil,
                                              originalName: nil,
                                              userGroupHash: "RZFAGPKJEOWQIR",
                                              typeCode: nil,
                                              uniqueId: nil)
        let req = SendReplyFileMessageRequest(messageInput: textRequest, uploadInput: uploadrequest)
        Chat.sharedInstance.sendFileMessage(inputModel: req) { uploadUniqueId in
            print(uploadUniqueId)
        } uploadProgress: { progress in
            print(progress)
        } messageUniqueId: { uniqueId in
            print(uniqueId)
        } onSent: { response in
            print(response)
        } onDelivered: { response in
            print(response)
        } onSeen: { response in
            print(response)
        }
    }
    
    @IBAction func btnSendImageMessageTaped(_ button:UIButton) {
        guard let image = UIImage(named: "test.png") else{return}
        let width = Int(image.size.width)
        let height = Int(image.size.height)
        let message = NewSendTextMessageRequest(threadId: threadId, textMessage: "test image upload message", messageType: .POD_SPACE_PICTURE)
        let imageRequest = NewUploadImageRequest(data: image.pngData() ?? Data(),hC: height, wC: width , fileName: "newImae.png", mimeType: "image/png" , userGroupHash: "RZFAGPKJEOWQIR" )
        Chat.sharedInstance.sendFileMessage(textMessage:message, uploadFile: imageRequest){ uploadFileProgress ,error in
            print(uploadFileProgress ?? error ?? "")
        }onSent: { sentResponse, uniqueId, error in
            print(sentResponse ?? "")
        }onSeen: { seenResponse, uniqueId, error in
            print(seenResponse ?? "")
        }onDeliver: { deliverResponse, uniqueId, error in
            print(deliverResponse ?? "")
        }uploadUniqueIdResult:{ uploadUniqueId in
            print(uploadUniqueId)
        }messageUniqueIdResult:{ messageUniqueId in
           print(messageUniqueId)
        }
    }
    
    @IBAction func btnSendLocationMessageTaped(_ button:UIButton) {
        let req = LocationMessageRequest(mapCenter: .init(lat: 35.660417, lng: 51.487187),
                                         threadId:      threadId,
                                         userGroupHash: "RZFAGPKJEOWQIR",
                                         mapImageName:  "map image name",
                                         textMessage:   "This is my location on the map"
                                        )
        Chat.sharedInstance.sendLocationMessage(req) { uploadProgress, error in
            print("upload progress is:\(uploadProgress?.percent ?? 0 )")
        } downloadProgress: { progress in
          print("download progress is:\(progress)")
        } onSent: { sentResponse, uniqueId, error in
            print(sentResponse ?? "")
        } onSeen: { seenResponse, uniqueId, error in
            print(seenResponse ?? "")
        } onDeliver: {  deliverResponse, uniqueId, error  in
            print(deliverResponse ?? "")
        } uploadUniqueIdResult: { uniqueId in
            print(uniqueId)
        } messageUniqueIdResult: { uniqueId in
            print(uniqueId)
        }
    }
    
    @IBAction func btnSendImageMessageOldTaped(_ button:UIButton) {
        let req = SendLocationMessageRequest(mapCenter:     (35.660417, 51.487187),
                                             mapHeight:     500,
                                             mapType:       "standard-night",
                                             mapWidth:      800,
                                             mapZoom:       15,
                                             mapImageName:  "staticLocationPic",
                                             repliedTo:     nil,
                                             systemMetadata: nil,
                                             textMessage:   "This is my location on the map",
                                             threadId:      threadId,
                                             userGroupHash: "RZFAGPKJEOWQIR",
                                             typeCode:      nil,
                                             uniqueId:      nil)
        Chat.sharedInstance.sendLocationMessage(inputModel: req) { downloadProgress in
            print(downloadProgress)
        } uploadUniqueId: { uniqueId in
            print(uniqueId)
        } uploadProgress: { uploadProgress in
            print(uploadProgress)
        } messageUniqueId: { uniqueId in
            print(uniqueId)
        } onSent: { response in
            print(response)
        } onDelivere: { response in
            print(response)
        } onSeen: { response in
            print(response)
        }

    }
    
    @IBAction func btnSendLocationMessageOldTaped(_ button:UIButton) {
        let req = SendLocationMessageRequest(mapCenter: (35.660400, 51.487376),
                                             mapHeight: 480,
                                             mapType: "standard-night",
                                             mapWidth: 640,
                                             mapZoom: 14,
                                             mapImageName: "staticLocationPic",
                                             repliedTo: nil,
                                             systemMetadata: nil,
                                             textMessage: "come here!",
                                             threadId: threadId,
                                             userGroupHash: "RZFAGPKJEOWQIR",
                                             typeCode: nil,
                                             uniqueId: nil)
        Chat.sharedInstance.sendLocationMessage(inputModel: req) { downloadProgress in
            print(downloadProgress)
        } uploadUniqueId: { uniqueId in
            print(uniqueId)
        } uploadProgress: { uploadProgress in
            print(uploadProgress)
        } messageUniqueId: { messageUniqueId in
            print(messageUniqueId)
        } onSent: { response in
            print(response)
        } onDelivere: { response in
            print(response)
        } onSeen: { response in
            print(response)
        }
    }
    
    @IBAction func btnCancelMessageTaped(_ button:UIButton) {
        let uniqueId = "kk"
        Chat.sharedInstance.cancelMessage(.init(textMessageUniqueId: uniqueId)) { canceled, uniqueId, error in
            print(canceled ?? "")
        }
    }
    
    @IBAction func btnCancelMessageOldTaped(_ button:UIButton) {
        let req  = CancelMessageRequestModel(textMessageUniqueId: "kk",
                                             editMessageUniqueId: nil,
                                             forwardMessageUniqueId: nil,
                                             fileMessageUniqueId: nil,
                                             uploadImageUniqueId: nil,
                                             uploadFileUniqueId: nil)
        Chat.sharedInstance.cancelSendMessage(inputModel: req) { canceled in
            print(canceled)
        }
    }
}
