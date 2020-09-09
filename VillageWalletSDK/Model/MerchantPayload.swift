import UIKit

/**
	Payload provided by the merchant to support other types of messaging.
 */
public protocol MerchantPayload {
	/** The ID of the previously configured schema that will be used to validate the contents of the payload */
	var schemaId: String? { get }

	/** The contents of the message */
	var payload: [String: AnyObject] { get }
}
