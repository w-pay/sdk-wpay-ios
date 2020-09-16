import UIKit

/**
	The result of creating a `PaymentSession`
 */
public protocol CreatePaymentSessionResult {
	/** The ID of the new `PaymentSession` */
	var paymentSessionId: String { get }

	/** A `QRCode` that is associated to the `PaymentSession` */
	var qr: QRCode? { get }
}
