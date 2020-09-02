import UIKit

public protocol MerchantPayload {
	var schemaId: String? { get }

	var payload: [String: AnyObject] { get }
}
