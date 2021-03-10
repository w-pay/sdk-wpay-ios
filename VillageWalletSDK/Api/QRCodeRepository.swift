import UIKit

public protocol QRCodeRepository {
	/**
	 Create a new QR code for an existing payment request
	 
	 - Parameter details: The details for the new QR code.
	 */
	func createPaymentRequestQRCode(
		details: NewPaymentRequestQRCode, 
		completion: @escaping ApiCompletion<QRCode>
	)

	/**
	 Retrieve a `QRCode` that is associated to a Payment Request by its ID

	 - Parameter qrCodeId: The ID to use.
	 */
	func getPaymentRequestQRCodeContentBy(
		qrCodeId: String,
		completion: @escaping ApiCompletion<QRCode>
	)

	/**
	 Cancels a QR code making it unusable

	 - Parameter qrCodeId: The ID of the QR code to cancel.
	 */
	func cancelPaymentQRCode(
		qrCodeId: String,
		completion: @escaping ApiCompletion<Void>
	)
}