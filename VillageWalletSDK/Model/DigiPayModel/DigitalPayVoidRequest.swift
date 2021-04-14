import UIKit

/**
 The JSON request structure of the Voids endpoint.
 */
public protocol DigitalPayVoidRequest {
	/** A merchant application specific reference number. This number should uniquely identify the transaction in the merchant’s system. */
	var clientReference: String { get }

	/** The merchant order number of the transaction. */
	var orderNumber: String { get }

	/** List of voided payments */
	var voids: [DigitalPayVoid] { get }
}

public protocol DigitalPayVoid {
	/** Container reference in the transaction logs. This number uniquely identifies the payment transaction in the container. */
	var paymentTransactionRef: String { get }
}
