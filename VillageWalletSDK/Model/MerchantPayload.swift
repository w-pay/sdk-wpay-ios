import UIKit

public protocol MerchantPayload {
	func schemaId() -> String?

	func payload() -> [String: AnyObject]
}
