import UIKit

/**
 The JSON request structure of the Openpay Voids endpoint.
 */
public protocol OpenPayVoidRequest {
	/** A merchant application specific reference number. This number should uniquely identify the transaction in the merchant’s system. */
	var clientReference: String { get }

	/** The merchant order number of the transaction. */
	var orderNumber: String? { get }

	/** List of voided payments */
	var voids: [DigitalPayVoid] { get }
}
