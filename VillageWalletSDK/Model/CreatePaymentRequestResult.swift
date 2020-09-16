import UIKit

/**
	The result from creating a new Payment Request.
 */
public protocol CreatePaymentRequestResult {
	/** The ID of the new Payment Request */
	var paymentRequestId: String { get }

	/** A `QRCode` that is associated to the Payment Request */
	var qr: QRCode? { get }
}
