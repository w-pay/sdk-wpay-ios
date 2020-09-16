import UIKit

/**
	Detail of a QR code
 */
public protocol QRCode {
	/** The ID of the QR code */
	var qrId: String { get }

	/** The ID of the Payment Request linked to this QR code */
	var referenceId: String { get }

	/** "The type of ID held in `QRCode.referenceId` */
	var referenceType: QRCodePaymentReferenceType? { get }

	/** The text content for the QR code. */
	var content: String { get }

	/** Base64 encoded PNG of the QR Code */
	var image: String { get }

	/**
		Timestamp indicating when the QR code will expire and become ineffective.

		If absent then the QR code will not expire until it is deleted
	 */
	var expiryTime: Date? { get }
}
