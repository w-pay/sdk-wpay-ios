import UIKit

/**
	Request to create a new `QRCode` for a Payment Request
 */
public protocol NewPaymentRequestQRCode {
	/** The ID of the payment request linked to this `QRCode` */
	var referenceId: String { get }

	/** The type of ID held in `NewPaymentRequestQRCode.referenceId` */
	var referenceType: QRCodePaymentReferenceType { get }

	/**
		The time in seconds that the QR code should remain valid.

		After this time any use of the QR code by a customer will fail to return any data.

		If absent, the API will default value to 0 which indicates that the code will not expire until it is deleted.
	 */
	var timeToLive: Int { get }
}
