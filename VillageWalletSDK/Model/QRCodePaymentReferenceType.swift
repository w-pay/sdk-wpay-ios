import UIKit

/**
	Types of `QRCode`s that can be generated by the API.
 */
public enum QRCodePaymentReferenceType {
	/** Associated to a Payment Request */
	case PAYMENT_REQUEST

	/** Associated to a `PaymentSession` */
	case PAYMENT_SESSION

	/**
		Convert a string to an instance of `QRCodePaymentReferenceType`

		- Parameter value: A string
		- Returns: nil if `value` is not a valid representation of an enum value
	 */
	public static func valueOf(value: String) -> QRCodePaymentReferenceType? {
		switch(value.uppercased()) {
			case "PAYMENT_REQUEST":
				return QRCodePaymentReferenceType.PAYMENT_REQUEST

			case "PAYMENT_SESSION":
				return QRCodePaymentReferenceType.PAYMENT_SESSION

			default:
				return nil
		}
	}
}
